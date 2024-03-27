//
//  User.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 26/03/24.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    let userName: String
    let userImage: String
}
