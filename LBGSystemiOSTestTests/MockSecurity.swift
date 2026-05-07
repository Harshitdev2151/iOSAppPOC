//
//  MockSecurity.swift
//  LBGSystemiOSTestTests
//
//  Created by Harshit Kumar on 07/05/26.
//

@testable import LBGSystemiOSTest

final class MockSecurity: DeviceSecurity {

    var jailbroken = false

    func isJailbroken() -> Bool {
        jailbroken
    }
}
