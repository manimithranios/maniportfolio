//
//  LoginView.swift
//  ManiApp
//
//  Created by neumacbcp on 26/02/26.
//

import SwiftUI

struct ExperienceView: View {
    @StateObject var viewModel = ExperienceViewModel()

    var body: some View {
        NavigationStack {
            VStack{
                HStack {
                    Spacer()
                    Text("Experience")
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
                        Text("Professional experience")
                            .font(.customFont(font: .bold, size: 20))
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                            .padding(.top,8)

                        // First Card List
                        VStack(spacing: 0) {
                            ForEach(viewModel.companyExperienceItems) { item in
                                CompanyExperienceItem(item: item)
                                    .padding()
                            }
                        }
                        .background(Color.white)
                        .padding(.bottom, 8)

                        Text("Technical Specialities")
                            .font(.customFont(font: .bold, size: 20))
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                            .padding(.vertical,8)


                        VStack(spacing: 0) {

                            ForEach(viewModel.experienceItems) { item in
                                ExperienceItem(item: item)
                                    .padding()

                                if item.id != viewModel.experienceItems.last?.id {
                                    Divider()
                                }
                            }
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.placeholderColor, lineWidth: 0.8)
                        )
                        .padding(.horizontal)
                        .padding(.bottom,16)
                    }
                }
            }

        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ExperienceView()
}
