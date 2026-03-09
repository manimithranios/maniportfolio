//
//  LoginView.swift
//  ManiApp
//
//  Created by neumacbcp on 26/02/26.
//

import SwiftUI

struct SignupView: View {
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var cpassword: String = ""
    @Environment(\.dismiss) private var dismiss
    @StateObject private var firebase = FirebaseConfig()
    @StateObject private var viewModel = SignupViewModel()

    var body: some View {
        NavigationStack{
            ZStack(){
                VStack(){
                    ZStack{
                        BackgroundEllipse(xOffset: -60, yOffset: -80, leadingPadding: -200)
                        BackgroundEllipse(yOffset: -130, leadingPadding: -110)
                    }
                    Text("SignUp")
                        .font(.customFont(font: .bold, size: 40))
                        .fontWeight(.bold)
                        .foregroundStyle(LinearGradient.brandGradient)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, -100)
                    
                    CustomTextField(placeHolder: "Name", imageName: "person", bColor: "textColor2", tOpacity: 1.0, value: $name)
                    CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textColor2", tOpacity: 1.0, value: $email)
                    CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $password)
                    CustomTextField(placeHolder: "Confirm Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $cpassword)
                    
                    
                    
                    Button(action: {
                        // themeManager.toggleAction()
                        if name.isEmpty || email.isEmpty || password.isEmpty || cpassword.isEmpty{
                            viewModel.message = "All fields are required"
                            return
                        }
                        viewModel.signUp(name: name, email: email, password: password, completion: { result in
                            print(result)

                        })
                        
                    }) {
                        CustomGradientButton(
                            title: "REGISTER",
                            background: LinearGradient.brandGradient
                        )
                    }
                    .onChange(of: firebase.user) { oldvalue, newvalue in
                        if newvalue != nil {
                            dismiss()
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                    
                    if let error = firebase.errorMessage{
                        Text(error)
                            .font(.customFont(font: .medium, size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(.red)
                    }
                    if let alertMessage = viewModel.message {
                        Text(alertMessage)
                            .font(.customFont(font: .medium, size: 16))
                            .foregroundColor(.red)
                    }
                    HStack(alignment: .center, ){
                        Text("Already have an account")
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .font(.customFont(font: .medium, size: 16))
                        Button(action: {
                            dismiss()

                        }, label: {
                            Text("LOGIN")
                                .fontWeight(.bold)
                                .foregroundColor(Color.textColor)
                                .font(.customFont(font: .medium, size: 16))
                        })
                        
//                        NavigationLink(destination: LoginView()) {
//                            Text("LOGIN")
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.textColor)
//                                .font(.system(size: 18))
//                        }
                    }.padding(.top,20)
                    Spacer()
                    
                }
            }
            //                TopBarView(backAction: {}).padding(.horizontal,20)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarHidden(true)
    }
    
    
}

#Preview {
    SignupView()
}
