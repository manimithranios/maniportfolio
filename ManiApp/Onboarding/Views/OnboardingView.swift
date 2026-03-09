//
//  LoginView.swift
//  ManiApp
//
//  Created by neumacbcp on 26/02/26.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        BackgroundEllipse(xOffset: -60, yOffset: -60, leadingPadding: -200)
                           BackgroundEllipse(yOffset: -130, leadingPadding: -110)
                    }
                    
                    Image("onbaording_icon1")
                        .resizable()
                        .tint(LinearGradient.brandGradient)
                        .foregroundStyle(LinearGradient.brandGradient)
                        .frame(width: 200,height: 200)
                    Spacer()
                    VStack(spacing: 20,){
                        Text("Welcome to My Portfolio")
                            .font(.customFont(font: .bold, size: 24))
                        Text("Explore my projects, skills, and professional journey. This app showcases my work, technical expertise, and passion for building modern iOS and Flutter applications.")
                            .font(.customFont(font: .regular, size: 12))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,16)
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Get Started")
                                .font(.customFont(font: .bold, size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(LinearGradient.brandGradient)
                                .cornerRadius(12)
                                .padding(.horizontal, 40)
                                .padding(.bottom, 40)
                        }
                       
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
