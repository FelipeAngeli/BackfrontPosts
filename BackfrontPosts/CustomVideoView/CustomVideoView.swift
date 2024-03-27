//
//  CustomVideoView.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 25/03/24.
//

import SwiftUI
import AVKit

struct CustomVideoView: View {
    
    var videoURL: URL?
    @Binding var isMuted: Bool
    @State var player = AVPlayer()
    
    init( isMuted: Binding<Bool>, videoURL: String) {
        _isMuted = isMuted
        self.videoURL = Bundle.main.url(forResource: videoURL, withExtension: "mp4")
       
    }
    
    var body: some View {
        if let url = videoURL {
            ZStack (alignment: .bottomTrailing){
                VideoPlayer(player: player)
                    .onAppear {
                        player.pause()
                        player = AVPlayer(url: url)
                        player.play()
                        player.isMuted = isMuted
                    }
                    .onDisappear(perform: {
                        player.pause()
                    })
                
                Color.white.opacity(0) //tira os elementos nativos do video
                Button {
                    isMuted.toggle()
                } label: {
                    Image(systemName:  isMuted ?
                          "speaker.slash.fill" :
                          "speaker.2.fill")
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.black.opacity(0.7))
                    .clipShape(Circle())
                }
                .padding(8)
            }
        } else {
            VStack{
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .foregroundStyle(.yellow)
                    .frame(width: 50, height: 50)
                Text("Ops, tivemos um problema com esse vídeo")
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    CustomVideoView( isMuted: .constant(true), videoURL: "demo2")
}
