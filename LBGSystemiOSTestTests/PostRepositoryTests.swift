import XCTest
@testable import LBGSystemiOSTest

final class PostRepositoryTests: XCTestCase {

    func test_fetch_success() async throws {
        let api = MockAPIService()
        let network = MockNetwork(true)

        let repo = PostRepositoryImpl(api: api, network: network)

        let posts = try await repo.getPosts()

        XCTAssertEqual(posts.count, 2)
    }

    func test_noInternet_throwsError() async {
        let api = MockAPIService()
        let network = MockNetwork(false)

        let repo = PostRepositoryImpl(api: api, network: network)

        do {
            _ = try await repo.getPosts()
            XCTFail("Expected error")
        } catch {
            XCTAssertTrue((error as? URLError)?.code == .notConnectedToInternet)
        }
    }

    func test_apiFailure() async {
        let api = MockAPIService()
        api.shouldFail = true

        let repo = PostRepositoryImpl(api: api, network: MockNetwork(true))

        do {
            _ = try await repo.getPosts()
            XCTFail("Expected failure")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
