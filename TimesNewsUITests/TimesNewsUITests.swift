//
//  TimesNewsUITests.swift
//  TimesNewsUITests
//
//  Created by Narek on 30.08.23.
//

import SwiftUI
import XCTest

final class TimesNewsUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_whenDarkModeButtonTapped() throws {
        let articlesNavigationBar = app.navigationBars["Articles"]

//        XCTAssertTrue(articlesNavigationBar.buttons["Brightness Higher"].exists)
//        XCTAssertTrue(articlesNavigationBar.buttons["Do Not Disturb"].exists)
    }
}
