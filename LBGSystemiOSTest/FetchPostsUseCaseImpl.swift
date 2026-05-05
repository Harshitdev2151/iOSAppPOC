//
//  FetchPostsUseCaseImpl.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
protocol FetchPostsUseCase {
    func execute() async throws -> [Post]
}

final class FetchPostsUseCaseImpl: FetchPostsUseCase {

    private let repository: PostRepository

    init(repository: PostRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Post] {
        try await repository.getPosts()
    }
}
