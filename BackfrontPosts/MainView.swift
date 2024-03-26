//
//  ContentView.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 17/03/24.
//

import SwiftUI

struct MainView: View {
    @State var selection = 1
    
    var body: some View {
        TabView(selection: $selection, 
                content: {
            
            HomeView()
                .tabItem {
                    Image(selection == 1 ? "home-selected" : "home")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 15)
                }
                .tag(1)
            
            NotificationView()
                .tabItem {
                    Image("plus")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 15)
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Image(selection == 3 ? "user-selected" : "user")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 15)
                }
                .tag(3)
        })
    }
}

#Preview {
    MainView()
}
