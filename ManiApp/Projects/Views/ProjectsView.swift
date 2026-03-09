//
//  LoginView.swift
//  ManiApp
//
//  Created by neumacbcp on 26/02/26.
//

import SwiftUI

struct ProjectsView: View {
    @StateObject var viewmodel = ProjectsViewModel()
    var body: some View {
        NavigationStack {
            VStack{
                HStack {
                    Spacer()
                    Text("Projects")
                        .font(.customFont(font: .bold, size: 20))
                        .foregroundStyle(LinearGradient.brandGradient)
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                ScrollView {
                VStack(alignment: .leading) {
                    // First Section Title
                            Text("Projects Deails")
                        .font(.customFont(font: .bold, size: 20))
                                .foregroundStyle(.black)
                                .padding(.horizontal)
                                .padding(.top,8)

                            // First Card List
                            VStack(spacing: 0) {
                                ForEach(viewmodel.projectsExperienceItems) { item in
                                    ProjectsItem(item: item)
                                        .padding()
                                }
                            }
                            .background(Color.white)
                            .padding(.bottom, 16)
                    

                    }
                }
            }
            
        }
            .navigationBarHidden(true)
    }
}

#Preview {
    ProjectsView()
}
