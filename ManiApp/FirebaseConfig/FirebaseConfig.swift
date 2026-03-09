//
//  FirebaseConfig.swift
//  ManiApp
//
//  Created by neumacbcp on 03/03/26.
//

import SwiftUI
import Combine
import FirebaseAuth
import FirebaseFirestore

class FirebaseConfig: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    @Published var isLoading = false
    @Published var profileData: ProfileData?
    let db = Firestore.firestore()

    init() {
        checkAuth()
    }

    func userSigninMethod(email: String, password: String)  {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password){[weak self] result, error in
            if let error = error{
                self?.errorMessage = error.localizedDescription
                return
            }
            self?.user = result?.user
            self?.isLoading = false
        }
    }
    func userSignUpMethod(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self] result, error in
            if let error = error{
                self?.errorMessage = error.localizedDescription
                return
            }
            self?.user = result?.user
        }
    }

    func forgotPassword(email: String, completion: @escaping (String) -> Void) {
        isLoading = true

        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                completion(error.localizedDescription)
            } else {
                completion("Password reset link sent to email")
            }
            self.isLoading = false

        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("Logout error: \(error.localizedDescription)")
        }
    }

    func fetchSummary() async {

        do {
            let snapshot = try await db.collection("summary")
                .document("summarydata")
                .getDocument()

            let summary = try snapshot.data(as: ProfileModel.self)
            profileData = summary.profileData

        } catch {
            print(error)
        }
    }

    func checkAuth() {

        Auth.auth().addStateDidChangeListener { auth, user in

            if user != nil {
                self.isLoggedIn = true
            } else {
                self.isLoggedIn = false
            }

        }
    }
}
