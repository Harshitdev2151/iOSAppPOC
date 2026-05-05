//
//  NetworkMonitor.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
protocol NetworkMonitoring {
    var isConnected: Bool { get }
}

final class NetworkMonitor: NetworkMonitoring {
    var isConnected: Bool = true
}
