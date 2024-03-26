//
//  PostView.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 25/03/24.
//

import SwiftUI

struct PostView: View {
    
    @Binding var post: Postdata
    @Binding var isMuted: Bool
    @State var isLikeAnimation:Bool = false

    
    var body: some View {
        VStack{
            HStack(spacing:10){
                Image(post.profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 33, height: 33)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(Color.gray, lineWidth: 0.5)
                    }
                Text(post.userName)
                    .font(Font.system(size: 14, weight: .semibold))
                Spacer()
                Button(action: {
                    print("option")
                }, label: {
                    Image("more")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                })
            }
            .padding(.vertical,10)
            .padding(.horizontal,12)
            
            ZStack {
                if !post.isVideo {
                    Image(post.postImage ?? "error")
                        .resizable()
                        .scaledToFit()
                        .onTapGesture (count: 2, perform: {
                            tappedLike()
                        })
        
                } else {
                    CustomVideoView(isMuted: $isMuted, videoURL: post.videoURL ?? "")
                        .frame(minHeight: 350)
                        .onTapGesture (count: 2, perform: {
                            tappedLike()
                        })
                }
                
                Image("white-heart")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 170)
                    .scaleEffect(isLikeAnimation ? 1 : 0)
                    .opacity(isLikeAnimation ? 1 : 0)
                    .animation(.spring, value: isLikeAnimation )
            }
            
            HStack{
                Button(action: {
                    post.isLiked.toggle()
                }, label: {
                    Image(post.isLiked ? "likeSelected" : "like")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                })
                Button(action: {
                    print("comentario")
                }, label: {
                    Image("comment")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                })
                
                Button(action: {
                    print("compartilhar")
                }, label: {
                    Image("shared")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                })
                Spacer()
                Button(action: {
                    post.isSaved.toggle()
                }, label: {
                    Image(post.isSaved ? "saveSelected"  :  "save")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                })
            }
            .padding(.top,8)
            .padding(.horizontal,15)
            
            if !post.caption.isEmpty {
                HStack {
                    Text(post.userName)
                        .font(Font.system(size: 14, weight: .bold))
                    + Text(" ")
                    + Text(post.caption)
                        .font(Font.system(size: 14, weight: .regular))
                    Spacer()
                }
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 15)
                .padding(.top, 2)
                .padding(.bottom, 10)
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    func tappedLike() {
        isLikeAnimation = true
        post.isLiked = true
        hideAnimation()
    }
    
    func hideAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation{
                isLikeAnimation = false
            }
        }
    }
}

#Preview {
    @State var post = PostMock[2]
    return PostView(post: $post, isMuted: .constant(true) )
    
}
