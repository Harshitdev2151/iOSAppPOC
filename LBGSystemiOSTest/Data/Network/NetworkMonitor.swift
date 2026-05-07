//
//  NetworkMonitor.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Network
import Foundation

protocol NetworkMonitoring {
    var isConnected: Bool { get }
}

final class NetworkMonitor: ObservableObject, NetworkMonitoring {

    @Published private(set) var isConnected = true

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    init() {

        monitor.pathUpdateHandler = { [weak self] path in

            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }

        monitor.start(queue: queue)
    }
}
