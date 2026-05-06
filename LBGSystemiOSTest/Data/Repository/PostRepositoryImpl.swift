//
//  PostRepositoryImpl.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
final class PostRepositoryImpl: PostRepository {

    private let api: APIServiceProtocol
    private let network: NetworkMonitoring

    init(api: APIServiceProtocol, network: NetworkMonitoring) {
        self.api = api
        self.network = network
    }

    func getPosts() async throws -> [Post] {
        guard network.isConnected else {
            throw URLError(.notConnectedToInternet)
        }
        return try await api.fetchPosts()
    }
}
