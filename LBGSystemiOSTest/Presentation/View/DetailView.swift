//
//  DetailView.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import SwiftUI

struct DetailView: View {

    let post: Post

    var body: some View {
        VStack(spacing: 20) {

            Text("\(AppStrings.postIDPrefix) \(post.id)")
                .font(.caption)
                .foregroundColor(.gray)
                .accessibilityIdentifier(AccessibilityIdentifiers.postIDText)

            Text(post.title.capitalized)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .accessibilityIdentifier(AccessibilityIdentifiers.postTitle)

            Spacer()
        }
        .padding()
        .navigationTitle(AppStrings.detailsTitle)
    }
}
