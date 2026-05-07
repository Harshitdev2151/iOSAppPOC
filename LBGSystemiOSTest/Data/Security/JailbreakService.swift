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

        // MARK: - Suspicious Paths

        let suspiciousPaths = [
            "/Applications/Cydia.app",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt",
            "/private/var/lib/apt/"
        ]

        for path in suspiciousPaths {
            if FileManager.default.fileExists(atPath: path) {
                return true
            }
        }
        // MARK: - Can Open Cydia

        if let url = URL(string: "cydia://package/com.example.package"),
           UIApplication.shared.canOpenURL(url) {
            return true
        }

        return false
        #endif
    }
}
