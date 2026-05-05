//
//  ContentView.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 05/05/26.
//

import SwiftUI

import SwiftUI

import SwiftUI

struct ContentView: View {

    @StateObject var vm: PostViewModel

    var body: some View {
        NavigationStack {

            Group {
                if vm.isLoading {
                    ProgressView()
                }
                else if let error = vm.errorMessage {
                    Text(error)
                }
                else {
                    List(vm.posts) { post in
                        NavigationLink(value: post) {
                            Text(post.title)
                        }
                    }
                }
            }
            .navigationTitle("Posts")

            // 👇 Navigation destination
            .navigationDestination(for: Post.self) { post in
                DetailView(post: post)
            }
        }
        .task {
            await vm.fetchPosts()
        }
    }
}

import SwiftUI

struct DetailView: View {

    let post: Post

    var body: some View {
        VStack(spacing: 20) {
            Text("Post ID: \(post.id)")
            Text(post.title)
                .font(.title)
        }
        .padding()
        .navigationTitle("Detail")
    }
}
