//
//  StoryView.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 25/03/24.
//

import SwiftUI

struct StoryView: View {
    
   @State var story: StoryData
    
    var body: some View {
        VStack(spacing: 8){
            ZStack{
                Circle().stroke(Color.gradient, style: StrokeStyle(lineWidth: 2.5, lineCap: .round))
                    .frame(width: 72, height: 72)
                Image(story.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 62, height: 62)
                    .clipShape(Circle())
                if story.myStory {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .background(Color.white.clipShape(Circle()))
                        .foregroundColor(.blue)
                        .offset(x: 28, y: 20)
                }
            }
            Text(story.name)
                .lineLimit(1)
                .font(Font.system(size: 12, weight: .regular))
                .foregroundStyle(.primary)
        }
        .padding(.top, 8)
    }
}

#Preview {
    StoryView(story: StoryMock[0])
}
