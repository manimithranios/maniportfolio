//
//  SignupViewModel.swift
//  ManiApp
//
//  Created by neumacbcp on 06/03/26.
//

import SwiftUI
import Combine
import FirebaseAuth
import FirebaseFirestore

class SignupViewModel: ObservableObject{
    @Published var message: String?
    func signUp(name: String, email: String, password: String, completion: @escaping (String) -> Void) {

        Auth.auth().createUser(withEmail: email, password: password) { result, error in

            if let error = error {
                completion(error.localizedDescription)
                return
            }

            guard let userID = result?.user.uid else {
                completion("User ID not found")
                return
            }

            let db = Firestore.firestore()

            db.collection("users").document(userID).setData([
                "name": name,
                "email": email,
                "createdAt": Timestamp()
            ]) { error in

                if let error = error {
                    completion(error.localizedDescription)
                } else {
                    completion("Signup successful")
                }
            }
        }
    }
}
