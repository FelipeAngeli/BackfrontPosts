//
//  Extensions+Colors.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 17/03/24.
//

import Foundation
import SwiftUI

extension Color {
    
    static var backgroundHomeColor: Color {
        Color(red: 237/255, green: 237/255, blue: 237/255)
    }
    
    static var gradient = LinearGradient(gradient: Gradient(colors: [Color.yellow, Color(red: 252/255, green: 175/255, blue: 69/255), Color.red, Color(red:225/255, green: 48/255,blue: 108/255), Color(red:193/255, green: 53/255, blue: 132/255),Color(red:131/255, green: 58/255, blue: 180/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)
  
}
