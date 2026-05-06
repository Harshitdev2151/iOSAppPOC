//
//  MockNetwork.swift
//  LBGSystemiOSTestTests
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
@testable import LBGSystemiOSTest

final class MockNetwork: NetworkMonitoring {
    var isConnected: Bool
    init(_ connected: Bool) { self.isConnected = connected }
}
