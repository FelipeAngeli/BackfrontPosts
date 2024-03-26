//
//  Postdata.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 25/03/24.
//

import Foundation

struct Postdata: Identifiable {
    var id = UUID()
    var profileImage: String
    var userName: String
    var postImage: String?
    var isLiked: Bool
    var isSaved: Bool
    var caption: String
    var isVideo: Bool
    var videoURL: String?
}
