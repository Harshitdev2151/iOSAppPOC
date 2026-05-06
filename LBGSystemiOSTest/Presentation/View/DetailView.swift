//
//  DetailView.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
import SwiftUI
struct DetailView: View {

    let post: Post

    var body: some View {
        VStack(spacing: 20) {

            Text("Post ID: \(post.id)")
                .font(.caption)
                .foregroundColor(.gray)

            Text(post.title.capitalized)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}
