//
//  Activaty.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 26/03/24.
//

import Foundation


enum ActivatyType {
    case liked
    case newFollower
    case suggestFollower
    case comment
}

struct Activity: Identifiable {
    var id = UUID()
    var activity: ActivatyType
    var duration: String
    var usersInContext: [User]
    var postImage: String?
    var comment: String?
    
    func getUsernames() -> String {
        return usersInContext.map{$0.userName}.joined(separator: ", ")
    }
}
