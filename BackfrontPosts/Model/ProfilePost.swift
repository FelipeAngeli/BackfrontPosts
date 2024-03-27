//
//  ProfilePost.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 26/03/24.
//

import Foundation

enum PostType: String {
    case video
    case multiple
}

struct ProfilePost: Identifiable {
    let id = UUID()
    let image: String
    let type: PostType
}
