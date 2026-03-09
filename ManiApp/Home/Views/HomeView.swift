//
//  LoginView.swift
//  ManiApp
//
//  Created by neumacbcp on 26/02/26.
//

import SwiftUI
import PDFKit
import UniformTypeIdentifiers

struct HomeView: View {
    @State private var email: String = "mani123@gmail.com"
    @State private var password: String = "123456"
    @State  private var isActive: Bool = false
    @EnvironmentObject var firebase: FirebaseConfig 
    @State private var showSheet = false
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack{
                // Custom navigation bar
                HStack {
                    Spacer()
                    Text("Summary")
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
                        Text(firebase.profileData?.name ?? "")
                            .font(.customFont(font: .bold, size: 20))
                            .foregroundStyle(Color.black)
                        Text(firebase.profileData?.designation ?? "")
                            .font(.customFont(font: .medium, size: 20))
                            .foregroundStyle(Color.black)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Summary")
                                .font(.customFont(font: .bold, size: 20))
                                .foregroundStyle(Color.black)

                            SummaryView()
                        }
                        .frame(maxWidth: .infinity)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Profile Summary")
                                .font(.customFont(font: .bold, size: 20))
                                .foregroundStyle(Color.black)

                            ProfileSummaryView(summary:viewModel.profileSummary)
                        }
                        .frame(maxWidth: .infinity)

                        VStack(alignment: .leading, spacing: 10) {


                            Text("Resume")
                                .font(.customFont(font: .bold, size: 20))
                                .foregroundStyle(Color.black)

                            PDFView()

                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom,20)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal,20)
                }
            }

        }
        .navigationBarHidden(true)
    }
}
struct SummaryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Over 9 years of experience in software development, specializing in native iOS applications with expertise in Flutter for cross-platform solutions. Skilled in architecture, UI/UX design, API integration, and App Store deployment. Committed to delivering scalable, high-performance, and user-centered applications.")
                .font(.customFont(font: .regular, size: 16))
                .foregroundColor(.black)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }

}

struct ProfileSummaryView: View {
    let summary : String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(summary)
                .font(.customFont(font: .regular, size: 16))
                .foregroundColor(.black)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }

}


struct PDFView: View {
    @State private var showFileImporter = false
    @State private var selectedPDF: URL?
    @State private var showPreview = false
    @State private var savedPDF: URL?

    var body: some View {

        VStack(spacing: 20) {
            Button("Upload PDF") {
                showFileImporter = true
            }
            if let pdfURL = selectedPDF {
                Text(pdfURL.lastPathComponent)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            if showPreview, let pdfURL = selectedPDF {
                PDFViewer(url: pdfURL)
                    .frame(height: 500)
            }
            HStack{
                Button(action: {
                }, label: {
                    customButton(title: "Save", bgColor: Color.lightCColor)
                })
                Spacer()
                Button(action: {
                    if selectedPDF != nil {
                        showPreview = true
                    }
                }, label: {
                    customButton(title: "Preview", bgColor: Color.lightCColor)
                })
            }

        }
        .fileImporter(
            isPresented: $showFileImporter,
            allowedContentTypes: [.pdf],
            allowsMultipleSelection: false
        ) { result in

            switch result {
            case .success(let urls):
                selectedPDF = urls.first
                showPreview = false
            case .failure(let error):
                print("Error selecting PDF:", error.localizedDescription)
            }
        }
    }



}


struct ContactsView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            // Email Section
            VStack(alignment: .leading, spacing: 4) {
                Text("Email:")
                    .font(.customFont(font: .bold, size: 16))
                    .foregroundColor(.black)

                Text("vtvmanikandan@gmail.com")
                    .font(.customFont(font: .regular, size: 16))
                    .foregroundColor(.lightCColor)
            }

            // Mobile Section
            VStack(alignment: .leading, spacing: 4) {
                Text("Mobile:")
                    .font(.customFont(font: .bold, size: 16))
                    .foregroundColor(.black)

                Text("+91 9600889277")
                    .font(.customFont(font: .regular, size: 16))
                    .foregroundColor(.lightCColor)
            }

            // Mobile Section
            VStack(alignment: .leading, spacing: 4) {
                Text("Linked in:")
                    .font(.customFont(font: .bold, size: 16))
                    .foregroundColor(.black)

                Text("manikandanio")
                    .font(.customFont(font: .regular, size: 16))
                    .foregroundColor(.lightCColor)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}
#Preview {
    HomeView()
}
