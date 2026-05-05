//
//  MockAPIService.swift
//  LBGSystemiOSTestTests
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
@testable import LBGSystemiOSTest   // 👈 IMPORTANT

final class MockAPIService: APIServiceProtocol {

    var shouldFail = false
    var returnEmpty = false

    func fetchPosts() async throws -> [Post] {

        if shouldFail {
            throw URLError(.badServerResponse)
        }

        if returnEmpty {
            return []
        }

        return [
            Post(id: 1, title: "Test Post 1"),
            Post(id: 2, title: "Test Post 2")
        ]
    }
}
