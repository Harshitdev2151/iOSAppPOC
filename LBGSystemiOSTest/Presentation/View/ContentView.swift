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

                // Background gradient
                LinearGradient(
                    colors: [.blue.opacity(0.2), .white],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                content
            }
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: Post.self) { post in
                DetailView(post: post)
            }
        }
        .task {
            await vm.fetchPosts()
        }
    }

    @ViewBuilder
    private var content: some View {

        if vm.isLoading {
            ProgressView("Loading Posts...")
                .font(.headline)
        } else if let error = vm.errorMessage {
            VStack(spacing: 16) {
                Text("⚠️ \(error)")
                    .foregroundColor(.red)

                Button("Retry") {
                    Task {
                        await vm.fetchPosts()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
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

            Text("Post #\(post.id)")
                .font(.caption)
                .foregroundColor(.gray)
            Text(post.title.capitalized)
                .accessibilityIdentifier("postTitle")
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)

            HStack {
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 6)
        )
    }
}
