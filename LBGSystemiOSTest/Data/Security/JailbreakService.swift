//
//  JailbreakService.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
protocol DeviceSecurity {
    func isJailbroken() -> Bool
}

final class JailbreakService: DeviceSecurity {
    func isJailbroken() -> Bool {
        #if targetEnvironment(simulator)
        return false
        #else
        return FileManager.default.fileExists(atPath: "/Applications/Cydia.app")
        #endif
    }
}
