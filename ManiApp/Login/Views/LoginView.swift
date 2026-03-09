//
//  LoginView.swift
//  ManiApp
//
//  Created by neumacbcp on 26/02/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = "mani123@gmail.com"
    @State private var password: String = "123456"
    @State  private var isActive: Bool = false
    @StateObject private var firebase = FirebaseConfig()
    @State private var showSheet = false
    
    //    @EnvironmentObject var themeManager: ThemeManager
    var body: some View {
        NavigationStack{
            ZStack(){
                VStack(){
                    ZStack{
                        BackgroundEllipse(xOffset: -60, yOffset: -80, leadingPadding: -200)
                        BackgroundEllipse(yOffset: -130, leadingPadding: -110)
                    }
                    Text("Login")
                        .font(.customFont(font: .bold, size: 30))
                        .fontWeight(.bold)
                        .foregroundStyle(LinearGradient.brandGradient)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, -100)
                    
                    CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textColor", tOpacity: 1.0, value: $email)
                    CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textColor", tOpacity: 0.6, value: $password)
                    
                    VStack(alignment: .trailing){
                        Button(action: {
                            showSheet = true
                        }) {
                            Text("Forgot Password")
                                .font(.customFont(font: .medium, size: 16))
                                .foregroundColor(.blackColor)
                        }
                        
                        
                        Button(action: {
                            firebase.userSigninMethod(email: email, password: password)
                        }) {
                            CustomGradientButton(
                                title: "LOGIN",
                                background: LinearGradient.brandGradient
                            )
                        }
                        .onChange(of: firebase.user) { oldvalue, newvalue in
                            if newvalue != nil {
                                isActive = true
                            }
                        }
                    }.padding(.horizontal, 20)
                        .padding(.top, 8)
                    
                    if let error = firebase.errorMessage{
                        Text(error)
                            .font(.customFont(font: .medium, size: 12))
                            .fontWeight(.medium)
                            .foregroundColor(.red)
                    }
                    HStack(alignment: .center, ){
                        Text("Dont have an account")
                            .font(.customFont(font: .medium, size: 16))
                            .foregroundColor(.black)

                        NavigationLink(destination: SignupView()) {
                            Text("SIGN UP")
                                .font(.customFont(font: .medium, size: 16))
                                .foregroundColor(Color.textColor)
                        }
                    }.padding(.top,20)
                    Spacer()
                    NavigationLink(destination: TabbarView(), isActive: $isActive) {
                    }
                    
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .sheet(isPresented:$showSheet) {
                ForgotPasswordView()
                    .presentationDetents([.medium, .large])       // half + full screen
                    .presentationDragIndicator(.visible)          // draggable indicator
                    .presentationCornerRadius(25)                 // rounded corners
                    .interactiveDismissDisabled(false)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
}
