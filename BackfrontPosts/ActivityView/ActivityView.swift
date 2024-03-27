//
//  ActivityView.swift
//  BackfrontPosts
//
//  Created by Felipe Angeli on 26/03/24.
//

import SwiftUI

struct ActivityView: View {
    
    let activity: Activity

    
    var body: some View {
        HStack {
            Image(activity.usersInContext.first?.userImage ?? "")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 40, height: 40)
            
            if activity.activity != .comment {
                Text(activity.getUsernames())
                    .font(Font.system(size: 12, weight: .semibold))
                + Text(getdescription())
                    .font(Font.system(size: 12, weight: .regular))
                + Text(activity.duration)
                    .font(Font.system(size: 10, weight: .light))
            } else {
                Text(activity.getUsernames())
                    .font(Font.system(size: 12, weight: .semibold))
                + Text(" comentou em sua publicação: ")
                    .font(Font.system(size: 12, weight: .regular))
                + Text(activity.comment ?? "")
                    .font(Font.system(size: 12, weight: .semibold))
                + Text(" " + activity.duration)
                    .font(Font.system(size: 10, weight: .light))
            }
            
            Spacer()
            
            if activity.activity == .suggestFollower || activity.activity == .newFollower {
                Button(activity.activity == .suggestFollower ? "Seguir" : "Seguindo") {
                    print("tapped button")
                }
                .font(Font.system(size: 14, weight: .semibold))
                .frame(width: 100, height: 30)
                .foregroundStyle(activity.activity == .suggestFollower ? .white : .primary)
                .background(activity.activity == .suggestFollower ? .blue : .white)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .overlay{
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(activity.activity == .suggestFollower ? .clear : .gray, lineWidth: 1)
                }
            } else {
                Image(activity.postImage ?? "user")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .padding(.horizontal)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
    }
    
    func getdescription() -> String {
        switch activity.activity {
        case .liked:
            return activity.usersInContext.count == 1 ? " curtiu a sua publicação" : " e outras pessoas curtira, a sua publicação. "
        case .newFollower:
            return activity.usersInContext.count == 1 ? " começou a seguir você" : " começaram a seguir você e mais \(activity.usersInContext.count - 1) pessoas. "
        case .suggestFollower:
            return " quem você talvez conheça, está na Backfront post. "
        case .comment:
            return ""
        }
    }
}

#Preview {
    ActivityView(activity: ActivityMock[3])
}
