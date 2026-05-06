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

    func fetchPosts() async throws -> [Post] {
        if shouldFail {
            throw URLError(.badServerResponse)
        }

        return [
            Post(id: 1, title: "Mock API 1"),
            Post(id: 2, title: "Mock API 2")
        ]
    }
}
