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
    private let network: NetworkMonitoring

    init(useCase: FetchPostsUseCase,
         network: NetworkMonitoring) {
        self.useCase = useCase
        self.network = network
    }

    func fetchPosts() async {

        guard network.isConnected else {
            errorMessage = "No Internet"
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            posts = try await useCase.execute()
        } catch {
            errorMessage = "Failed to load data"
        }

        isLoading = false
    }
}
