//
//  APIService.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
protocol APIServiceProtocol {
    func fetchPosts() async throws -> [Post]
}

final class APIService: APIServiceProtocol {
    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Post].self, from: data)
    }
}
