//
//  StoryData.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 25/03/24.
//

import Foundation


struct StoryData: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var myStory: Bool
}
