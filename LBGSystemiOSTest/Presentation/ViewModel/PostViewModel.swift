//
//  PostViewModel.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation

final class PostViewModel: ObservableObject {

    @Published var posts: [Post] = []
    @Published var isLoading = false

    @Published var showErrorAlert = false
    @Published var errorMessage = ""

    private let useCase: FetchPostsUseCase

    init(useCase: FetchPostsUseCase) {
        self.useCase = useCase
    }
    @MainActor
    func fetchPosts() async {

        isLoading = true

        do {
            posts = try await useCase.execute()
        } catch {

            if (error as? URLError)?.code == .notConnectedToInternet {
                errorMessage = AppStrings.noInternet
            } else {
                errorMessage = AppStrings.failedToLoadPosts
            }

            showErrorAlert = true
        }

        isLoading = false
    }
}
