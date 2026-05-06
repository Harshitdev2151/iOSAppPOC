//
//  PostViewModelTests.swift
//  LBGSystemiOSTestTests
//
//  Created by Harshit Kumar on 06/05/26.
//
import XCTest
@testable import LBGSystemiOSTest

@MainActor
final class PostViewModelTests: XCTestCase {

    func test_success() async {
        let vm = makeVM()

        await vm.fetchPosts()

        XCTAssertEqual(vm.posts.count, 2)
        XCTAssertNil(vm.errorMessage)
        XCTAssertFalse(vm.isLoading)
    }

    func test_failure() async {
        let repo = MockRepository()
        repo.shouldFail = true

        let vm = makeVM(repo: repo)

        await vm.fetchPosts()

        XCTAssertTrue(vm.posts.isEmpty)
        XCTAssertNotNil(vm.errorMessage)
        XCTAssertFalse(vm.isLoading)
    }

    func test_emptyData() async {
        let repo = MockRepository()
        repo.returnEmpty = true

        let vm = makeVM(repo: repo)

        await vm.fetchPosts()

        XCTAssertTrue(vm.posts.isEmpty)
        XCTAssertNil(vm.errorMessage)
    }

    func test_noInternet() async {
        let repo = FailingRepo(error: URLError(.notConnectedToInternet))
        let vm = makeVM(repo: repo)

        await vm.fetchPosts()

        XCTAssertEqual(vm.errorMessage, "No Internet")
    }

    func test_loadingState() async {
        let vm = makeVM()

        let task = Task {
            await vm.fetchPosts()
        }

        XCTAssertTrue(vm.isLoading) // during execution

        await task.value
        XCTAssertFalse(vm.isLoading)
    }
}

// MARK: - Helpers

extension PostViewModelTests {

    func makeVM(repo: PostRepository = MockRepository()) -> PostViewModel {
        let useCase = FetchPostsUseCaseImpl(repository: repo)
        return PostViewModel(useCase: useCase)
    }
}
final class FailingRepo: PostRepository {

    let error: Error

    init(error: Error) {
        self.error = error
    }

    func getPosts() async throws -> [Post] {
        throw error
    }
}
