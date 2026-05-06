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
        VStack {
            Text("ID: \(post.id)")
            Text(post.title)
        }
        .navigationTitle("Detail")
    }
}
