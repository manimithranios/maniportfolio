//
//  ProfileModel.swift
//  ManiApp
//
//  Created by neumacbcp on 09/03/26.
//

import SwiftUI
import FirebaseFirestore

struct ProfileModel: Identifiable,Codable {
    @DocumentID var id: String?
    var profileData: ProfileData

}


struct ProfileData: Codable {
    var birthday: String?
    var designation: String?
    var email: String?
    var name: String?
    var profileImage: String?

}



