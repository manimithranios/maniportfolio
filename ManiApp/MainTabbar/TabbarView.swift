//
//  LoginView.swift
//  ManiApp
//
//  Created by neumacbcp on 26/02/26.
//

import SwiftUI

struct TabbarView: View {

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")

                    Text("Home")
                        .font(.customFont(font: .medium, size: 12))
                }
            ExperienceView()
                .tabItem {
                    Image(systemName: "briefcase.fill")
                    Text("Experience")
                        .font(.customFont(font: .medium, size: 12))

                }
            ProjectsView()
                .tabItem {
                    Image(systemName: "folder.fill")
                    Text("Projects")
                        .font(.customFont(font: .medium, size: 12))

                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                        .font(.customFont(font: .medium, size: 12))

                }
        }
        .accentColor(.lightCColor)
    }
}

#Preview {
    TabbarView()
}
