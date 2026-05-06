//
//  PostRepository.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
protocol PostRepository {
    func getPosts() async throws -> [Post]
}
