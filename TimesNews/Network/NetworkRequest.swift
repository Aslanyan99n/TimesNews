//
//  NetworkRequest.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import Foundation
import SwiftUI

enum NetworkRequestError: Error, LocalizedError {
    case itemsNotFound
    case wrongURL
    case canNotDecodeFromDataToModel
    case canNotReceiveResponse
    case badRequest
}

protocol NetworkRequestProtocol {
    var baseURLString: String { get }
    var apiKey: String { get }
    var endPoint: String { get }

    func urlFromString(endpoint: String) throws -> URL
    func fetchData<T: Codable>(url: URL) async throws -> T
    func fetchData<T: Codable>(_ type: T.Type, url: URL, completion: @escaping (Result<T, NetworkRequestError>) -> Void)
}

class NetworkRequest: ObservableObject, NetworkRequestProtocol {
    @Published var requestModel: RequestModel = .init(articles: [])
    @Published var isLoading: Bool = true

    var baseURLString: String = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key="
    var apiKey: String = "tFfRxNv6RXaR5lXpVt6TRTCUxGvlGzmD"
    var endPoint: String {
        baseURLString + apiKey
    }

    func urlFromString(endpoint: String) throws -> URL {
        guard let url = URL(string: endPoint) else {
            throw NetworkRequestError.wrongURL
        }
        return url
    }

    // ASYNC GENERIC FUNCION FOR FETCH DATA FROM NETWORK

    func fetchData<T: Codable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard
            let response = response as? HTTPURLResponse,
            response.statusCode == 200
        else { throw NetworkRequestError.itemsNotFound }

        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkRequestError.canNotDecodeFromDataToModel
        }
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = false
        }
        return decodedData
    }

    // SYNC GENERIC FUNCION FOR FETCH DATA FROM NETWORK

    func fetchData<T: Codable>(_ type: T.Type, url: URL, completion: @escaping (Result<T, NetworkRequestError>) -> Void) {
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            if let error {
                print("Request error: \(String(describing: error))")
                completion(.failure(.badRequest))
                return
            }

            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200, let data
            else {
                completion(.failure(.canNotReceiveResponse))
                return
            }

            DispatchQueue.main.async { [weak self] in
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                    self?.isLoading = false
                } catch {
                    print("Error decoding: ", error)
                    completion(.failure(.canNotDecodeFromDataToModel))
                }
            }
        }.resume()
    }
}
