//
//  PostViewModelTests.swift
//  LBGSystemiOSTestTests
//
//  Created by Harshit Kumar on 06/05/26.
//

import XCTest
@testable import LBGSystemiOSTest

@MainActor   // 👈 ADD THIS
final class PostViewModelTests: XCTestCase {

    func test_success() async {
        let api = MockAPIService()
        let repo = PostRepositoryImpl(api: api)
        let useCase = FetchPostsUseCaseImpl(repository: repo)

        let vm = PostViewModel(useCase: useCase,
                               network: MockNetwork(true))

        await vm.fetchPosts()

        XCTAssertEqual(vm.posts.count, 2)
        XCTAssertNil(vm.errorMessage)
    }

    func test_failure() async {
        let api = MockAPIService()
        api.shouldFail = true

        let repo = PostRepositoryImpl(api: api)
        let useCase = FetchPostsUseCaseImpl(repository: repo)

        let vm = PostViewModel(useCase: useCase,
                               network: MockNetwork(true))

        await vm.fetchPosts()

        XCTAssertTrue(vm.posts.isEmpty)
        XCTAssertNotNil(vm.errorMessage)
    }

    func test_noInternet() async {
        let api = MockAPIService()
        let repo = PostRepositoryImpl(api: api)
        let useCase = FetchPostsUseCaseImpl(repository: repo)

        let vm = PostViewModel(useCase: useCase,
                               network: MockNetwork(false))

        await vm.fetchPosts()

        XCTAssertEqual(vm.errorMessage, "No Internet")
    }

    // ✅ FIXED loading test
    func test_loadingState() async {
        let vm = PostViewModel(
            useCase: FetchPostsUseCaseImpl(repository: MockRepository()),
            network: MockNetwork(true)
        )

        await vm.fetchPosts()

        XCTAssertFalse(vm.isLoading)
    }

    final class EmptyRepo: PostRepository {
        func getPosts() async throws -> [Post] { [] }
    }

    func test_emptyData() async {
        let vm = PostViewModel(
            useCase: FetchPostsUseCaseImpl(repository: EmptyRepo()),
            network: MockNetwork(true)
        )

        await vm.fetchPosts()

        XCTAssertTrue(vm.posts.isEmpty)
    }

    func test_multipleCalls() async {
        let vm = PostViewModel(
            useCase: FetchPostsUseCaseImpl(repository: MockRepository()),
            network: MockNetwork(true)
        )

        await vm.fetchPosts()
        await vm.fetchPosts()

        XCTAssertFalse(vm.posts.isEmpty)
    }

    func test_errorMessageSet() async {
        let repo = MockRepository()
        repo.shouldFail = true

        let vm = PostViewModel(
            useCase: FetchPostsUseCaseImpl(repository: repo),
            network: MockNetwork(true)
        )

        await vm.fetchPosts()

        XCTAssertEqual(vm.errorMessage, "Failed to load data")
    }
}
