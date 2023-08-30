//
//  NetworkRequestTest.swift
//  TimesNewsTests
//
//  Created by Narek on 30.08.23.
//

import XCTest
@testable import TimesNews

final class NetworkRequestTest: XCTestCase {
    var sut: NetworkRequestProtocol!

    override func setUpWithError() throws {
        sut = NetworkRequest()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_syncNetworkRequest_ShouldReturnResult() {
        //        var resultError: Error
        //        var requestModel: RequestModel
        //        do {
        //            requestModel = try sut.getArticles()
        //        } catch {
        //            resultError = error as! NetworkRequestError
        //        }
        //
        //        let expected = RequestModel(articles: [articleMockData])
        //
        //        XCTAssertEqual(expected, requestModel)

        let baseUrl = sut.baseURLString
        let apiKey = sut.apiKey
        let endPoint = sut.endPoint

        let expected = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=tFfRxNv6RXaR5lXpVt6TRTCUxGvlGzmD"

        XCTAssertEqual(expected, endPoint)
    }
}
