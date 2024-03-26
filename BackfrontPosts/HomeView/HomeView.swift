//
//  HomeView.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 17/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel:HomeviewModel = HomeviewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.backgroundHomeColor
               
                HStack(spacing:20.0){
                    ScrollView(.vertical) {
                        LazyVStack{
                            ForEach(viewModel.storyList) { story in
                                    StoryView(story: story)
                            }
                        }
                    }
                    .background(Color.white)
                    .frame(width: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    ScrollView(.vertical) {
                        LazyVStack{
                            ForEach($viewModel.postList) { post in
                                PostView(post: post, isMuted: $viewModel.isMuted)
                            }
                        }
                    }
                }
                .padding()
                
            }.toolbarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Image("bf_logo")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 25)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack{
                            Button(action: {
                                print("go search")
                            }, label: {
                                Image("search")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 25,height: 25)
                            })
                            
                            
                            Button(action: {
                                print("go message")
                            }, label: {
                                ZStack{
                                    Image("message")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 25,height: 25)
                                    Text("3")
                                        .font(.system(size: 13, weight: .bold))
                                        .frame(width: 18, height: 18)
                                        .background(Color.red)
                                        .foregroundStyle(.white)
                                        .clipShape(Circle())
                                        .offset(x: 9, y: -9)
                                }
                            })
                        }}

                })
            
        }
        
        
    }
}

#Preview {
    HomeView()
}
