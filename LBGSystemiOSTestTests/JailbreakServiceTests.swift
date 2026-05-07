//
//  JailbreakServiceTests.swift
//  LBGSystemiOSTestTests
//
//  Created by Harshit Kumar on 07/05/26.
//

import XCTest
@testable import LBGSystemiOSTest

final class JailbreakServiceTests: XCTestCase {

    func test_mockSecurity_jailbrokenTrue() {

        let security = MockSecurity()
        security.jailbroken = true

        XCTAssertTrue(
            security.isJailbroken()
        )
    }

    func test_mockSecurity_jailbrokenFalse() {

        let security = MockSecurity()

        XCTAssertFalse(
            security.isJailbroken()
        )
    }
}
