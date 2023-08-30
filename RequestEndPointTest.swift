//
//  RequestEndPointTest.swift
//  TimesNewsTests
//
//  Created by Narek on 30.08.23.
//

@testable import TimesNews
import XCTest

final class RequestEndpointTest: XCTestCase {
    var sut: NetworkRequestProtocol!

    override func setUpWithError() throws {
        sut = NetworkRequest()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_givenBaseUrlAndApiKey_ShouldReceiveEndpoint() {
        // Given
        let endPoint = sut.endPoint

        // When
        let expected = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=tFfRxNv6RXaR5lXpVt6TRTCUxGvlGzmD"

        // Then

        XCTAssertEqual(expected, endPoint)
    }

    func test_givenEndPoint_checkConvertingToUrl() {
//        let url = sut.

        let expected = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=tFfRxNv6RXaR5lXpVt6TRTCUxGvlGzmD")

//        XCTAssertEqual(expected, url)
    }
}
