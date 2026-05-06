//
//  NetworkMonitor.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
import Network

protocol NetworkMonitoring {
    var isConnected: Bool { get }
}

final class NetworkMonitor: ObservableObject, NetworkMonitoring {

    @Published private(set) var isConnected: Bool = true
    private let monitor = NWPathMonitor()

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: DispatchQueue(label: "network"))
    }
}
