//
//  Post.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 06/05/26.
//

import Foundation
struct Post: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let title: String
}
