import XCTest
@testable import LBGSystemiOSTest

final class FetchPostsUseCaseTests: XCTestCase {

    func test_execute_returnsData() async throws {
        let repo = MockRepository()
        let useCase = FetchPostsUseCaseImpl(repository: repo)

        let posts = try await useCase.execute()

        XCTAssertEqual(posts.count, 2)
    }
}
