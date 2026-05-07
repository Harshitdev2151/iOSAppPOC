//
//  ContentView.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 05/05/26.
//
import SwiftUI

struct ContentView: View {

    @StateObject var vm: PostViewModel

    var body: some View {

        NavigationStack {

            ZStack {

                LinearGradient(
                    colors: [.blue.opacity(0.2), .white],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                content
            }
            .navigationTitle(AppStrings.postsTitle)
            .navigationDestination(for: Post.self) {
                DetailView(post: $0)
            }
            .task {
                await vm.fetchPosts()
            }
            .alert(AppStrings.errorTitle,
                   isPresented: $vm.showErrorAlert) {

                Button(AppStrings.retry) {
                    Task {
                        await vm.fetchPosts()
                    }
                }
                .accessibilityIdentifier(AccessibilityIdentifiers.retryButton)

                Button(AppStrings.cancel,
                       role: .cancel) {}

            } message: {
                Text(vm.errorMessage)
            }
        }
    }

    @ViewBuilder
    private var content: some View {

        if vm.isLoading {
            ProgressView(AppStrings.loading)
        } else {
            ScrollView {
                LazyVStack(spacing: 16) {

                    ForEach(vm.posts) { post in

                        NavigationLink(value: post) {
                            PostCardView(post: post)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
        }
    }
}

struct PostCardView: View {

    let post: Post

    var body: some View {

        VStack(alignment: .leading, spacing: 10) {

            Text("\(AppStrings.postPrefix)\(post.id)")
                .font(.caption)
                .foregroundColor(.gray)

            Text(post.title.capitalized)
                .accessibilityIdentifier(
                    AccessibilityIdentifiers.postTitle
                )
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)

            HStack {
                Spacer()

                Image(systemName: SystemImages.arrowRight)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(
                    color: .black.opacity(0.1),
                    radius: 6
                )
        )
        .accessibilityIdentifier(
            AccessibilityIdentifiers.postCard
        )
    }
}
