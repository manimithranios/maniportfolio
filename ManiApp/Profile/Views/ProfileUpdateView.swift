//
//  ProfileUpdateView.swift
//  ManiApp
//
//  Created by neumacbcp on 05/03/26.
//

import SwiftUI

struct ProfileUpdateView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var profile: String = ""
    @State private var birthday: String = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack{
                // Custom navigation bar
                HStack {
                    Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.customFont(font: .medium, size: 18))
                                .foregroundColor(.black)
                        }
                    Spacer()
                    
                    Text("Update Profile")
                        .font(.customFont(font: .bold, size: 20))
                        .foregroundStyle(LinearGradient.brandGradient)
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                ScrollView {
                    VStack( spacing: 16) {
                        Image("my_photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .padding(.top,12)
                            .clipShape(Circle())
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        
                        CustomTextField(placeHolder: "Name", imageName: "person", bColor: "textColor2", tOpacity: 1.0, value: $name)
                        CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textColor2", tOpacity: 1.0, value: $email)
                        CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $phone)
                        CustomTextField(placeHolder: "Confirm Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $birthday)
                        
                        Button(action: {
                            // themeManager.toggleAction()
//                            firebase.userSignUpMethod(email: email, password: password)
                        }) {
                            CustomGradientButton(
                                title: "UPDATE PROFILE",
                                background: LinearGradient.brandGradient
                            )
                        }.padding(.top,16)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal,20)
                }
            }
            
        }
            .navigationBarHidden(true)
    }
}

#Preview {
    ProfileUpdateView()
}
