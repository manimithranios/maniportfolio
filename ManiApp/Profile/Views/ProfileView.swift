//
//  LoginView.swift
//  ManiApp
//
//  Created by neumacbcp on 26/02/26.
//

import SwiftUI

struct ProfileView: View {
    @State private var email: String = "mani123@gmail.com"
    @State private var password: String = "123456"
    @State  private var isActive: Bool = false
    @StateObject private var firebase = FirebaseConfig()
    @State private var showSheet = false
    @State private var showLogoutAlert = false
    var body: some View {
        NavigationStack {
            VStack{
                // Custom navigation bar
                HStack {
                    Spacer()
                    Text("Profile")
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
                        Text("Manikandan V")
                            .font(.customFont(font: .bold, size: 20))
                            .foregroundStyle(Color.black)
                        Text("iOS & Flutter Developer")
                            .font(.customFont(font: .medium, size: 20))
                            .foregroundStyle(Color.black)
                            .frame(maxWidth: .infinity)
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Contacts")
                                .font(.customFont(font: .bold, size: 20))
                                .foregroundStyle(Color.black)
                            
                            ContactsView()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom,10)
                        
                        NavigationLink(destination: ProfileUpdateView() .toolbar(.hidden, for: .tabBar)){
                            ProfileUpdate()
                        }
                        Button(action: {
                            showLogoutAlert = true
                        }, label: {
                            LogoutView()
                        }).padding(.bottom,20)
                            .alert("Are you sure?", isPresented: $showLogoutAlert) {
                                Button("Logout", role: .destructive) {
                                    firebase.signOut()
                                }
                                Button("Cancel", role: .cancel) { }
                            }

                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal,20)
                }
            }
            
        }
            .navigationBarHidden(true)
    }
}

struct ProfileUpdate: View {
    
    var body: some View {
        HStack() {
            Text("Profile Update")
                .font(.customFont(font: .bold, size: 16))
                .foregroundColor(.black)
            Spacer()
            
            Image(systemName: "chevron.right")
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}


struct LogoutView: View {
    
    var body: some View {
        HStack() {
            Text("Logout")
                .font(.customFont(font: .bold, size: 16))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "rectangle.portrait.and.arrow.right")
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}



#Preview {
    ProfileView()
}
