//
//  PostGridView.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 27/03/24.
//

import SwiftUI

struct PostGridView: View {
    
    let data: [ProfilePost]
    let gridlayout: [GridItem] = Array(repeating: .init(.flexible(), spacing: 2), count: 3)
    
    var body: some View {
        LazyVGrid(columns: gridlayout, spacing: 2, content: {
            ForEach(data) {item in
                ZStack(alignment: .topTrailing) {
                    Image(item.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: (UIScreen.main.bounds.width - (CGFloat(gridlayout.count) * 2)) / CGFloat(gridlayout.count))
                    
                    Image(item.type.rawValue)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .padding(5)
                }
            }
        })
    }
}

#Preview {
    PostGridView(data: ProfilePostMock)
}
