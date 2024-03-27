//
//  ProfileView.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 17/03/24.
//

import SwiftUI

struct ProfileView: View {
    
    var viewModel = ProfileViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false){
                VStack {
                   UserProfileView()
                    HiglightView(data: viewModel.highlightData)
                    PostGridView(data: viewModel.profilePostData)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content:{
                ToolbarItem(placement: .topBarLeading) {
                    Text("backfrontacademy")
                        .font(Font.system(size: 22, weight: .bold))
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        print("tapped configuration")
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 32, height: 22)
                    }
                }
            })
        }
    }
}

#Preview {
    ProfileView()
}
