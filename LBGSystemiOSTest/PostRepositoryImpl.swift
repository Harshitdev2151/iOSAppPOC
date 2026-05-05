//
//  PostRepositoryImpl.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation

protocol PostRepository {
    func getPosts() async throws -> [Post]
}

final class PostRepositoryImpl: PostRepository {

    private let api: APIServiceProtocol

    init(api: APIServiceProtocol) {
        self.api = api
    }

    func getPosts() async throws -> [Post] {
        try await api.fetchPosts()
    }
}
