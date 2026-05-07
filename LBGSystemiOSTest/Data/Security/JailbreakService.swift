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

        let paths = [
            "/Applications/Cydia.app",
            "/bin/bash",
            "/usr/sbin/sshd"
        ]

        return paths.contains {
            FileManager.default.fileExists(atPath: $0)
        }

        #endif
    }
}
