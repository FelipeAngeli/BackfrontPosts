//
//  NotificationView.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 17/03/24.
//

import SwiftUI

struct NotificationView: View {
    
    @State private var viewModel: NotificationViewModel = NotificationViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    
                    ForEach(viewModel.activityList) { activity in
                        
                        ActivityView(activity: activity)
                    }
                }
            }
            .navigationTitle("Notificações")
            .navigationBarTitleDisplayMode(.large)
            
        }
    }
}

#Preview {
    NotificationView()
}
