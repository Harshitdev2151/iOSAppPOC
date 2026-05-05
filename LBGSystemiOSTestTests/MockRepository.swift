import Foundation
@testable import LBGSystemiOSTest   // 👈 your app name

final class MockRepository: PostRepository {

    var shouldFail = false
    var returnEmpty = false

    func getPosts() async throws -> [Post] {

        if shouldFail {
            throw URLError(.badServerResponse)
        }

        if returnEmpty {
            return []
        }

        return [
            Post(id: 1, title: "Mock Post 1"),
            Post(id: 2, title: "Mock Post 2")
        ]
    }
}
