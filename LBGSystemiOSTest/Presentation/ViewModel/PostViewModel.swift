//
//  PostViewModel.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
import SwiftUI
@MainActor
final class PostViewModel: ObservableObject {

    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let useCase: FetchPostsUseCase

    init(useCase: FetchPostsUseCase) {
        self.useCase = useCase
    }

    func fetchPosts() async {
        isLoading = true
        errorMessage = nil

        do {
            posts = try await useCase.execute()
        } catch {
            if (error as? URLError)?.code == .notConnectedToInternet {
                errorMessage = "No Internet"
            } else {
                errorMessage = "Failed to load data"
            }
        }

        isLoading = false
    }
}
