//
//  JailbreakBlockedUITests.swift
//  LBGSystemiOSTestUITests
//
//  Created by Harshit Kumar on 07/05/26.
//

import XCTest

final class JailbreakBlockedUITests: XCTestCase {

    func test_jailbreakBlockedScreenExists() {

        let app = XCUIApplication()

        // Launch with argument
        app.launchArguments = ["-jailbroken"]

        app.launch()

        XCTAssertTrue(
            app.staticTexts["securityTitle"]
                .waitForExistence(timeout: 5)
        )
    }
}
