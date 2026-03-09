//
//  ForgotPasswordView.swift
//  ManiApp
//
//  Created by neumacbcp on 03/03/26.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = "mani123@gmail.com"
    @Environment(\.dismiss) private var dismiss
    @StateObject private var firebase = FirebaseConfig()
    @State private var message: String = ""
    @State private var showSuccessAlert = false
    @State var isLoading = false

    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Forgot Password")
                    .font(.customFont(font: .bold, size: 30))
                    .fontWeight(.bold)
                    .foregroundStyle(LinearGradient.brandGradient)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)

                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textColor", tOpacity: 1.0, value: $email)

                Button(action: {
                    isLoading = true
                    firebase.forgotPassword(email: email) { result in
                        message = result
                        showSuccessAlert = true
                        isLoading = false
                    }

                }) {
                    ZStack {
                            CustomGradientButton(
                                title: "",
                                background: LinearGradient.brandGradient
                            )

                            if isLoading {
                                ProgressView()
                                    .tint(.white)
                            } else {
                                Text("Send Reset Link")
                                    .font(.customFont(font: .bold, size: 20))
                                    .foregroundColor(.white)
                            }
                        }
                }.padding(.horizontal, 16)
                    .padding(.vertical, 20)
                    .alert("Message", isPresented: $showSuccessAlert) {
                        Button("OK") {
                            dismiss()
                        }
                    } message: {
                        Text(message)
                            .multilineTextAlignment(.center)
                    }

            }
            .padding(.horizontal, 0)   // remove extra horizontal padding
            .frame(maxWidth: .infinity)
            .background(Color.white)     // full white background
        }
    }

}

#Preview {
    ForgotPasswordView()
}
