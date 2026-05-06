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
        let vm = PostViewModel(
            useCase: FetchPostsUseCaseImpl(repository: MockRepository())
        )

        await vm.fetchPosts()

        XCTAssertEqual(vm.posts.count, 2)
        XCTAssertNil(vm.errorMessage)
    }

    func test_failure() async {
        let repo = MockRepository()
        repo.shouldFail = true

        let vm = PostViewModel(
            useCase: FetchPostsUseCaseImpl(repository: repo)
        )

        await vm.fetchPosts()

        XCTAssertNotNil(vm.errorMessage)
    }

    func test_empty() async {
        let repo = MockRepository()
        repo.returnEmpty = true

        let vm = PostViewModel(
            useCase: FetchPostsUseCaseImpl(repository: repo)
        )

        await vm.fetchPosts()

        XCTAssertTrue(vm.posts.isEmpty)
    }

    func test_noInternet() async {
        let repo = PostRepositoryImpl(
            api: APIService(),
            network: MockNetwork(false)
        )

        let vm = PostViewModel(
            useCase: FetchPostsUseCaseImpl(repository: repo)
        )

        await vm.fetchPosts()

        XCTAssertEqual(vm.errorMessage, "No Internet")
    }
}
