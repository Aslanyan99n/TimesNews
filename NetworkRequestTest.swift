//
//  NetworkRequestTest.swift
//  TimesNewsTests
//
//  Created by Narek on 30.08.23.
//

@testable import TimesNews
import XCTest

final class NetworkRequestTest: XCTestCase {
    var sut: NetworkRequestProtocol!

    override func setUpWithError() throws {
        sut = NetworkRequest()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() {

    }
}
