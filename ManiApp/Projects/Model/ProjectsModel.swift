//
//  ProjectsModel.swift
//  ManiApp
//
//  Created by neumacbcp on 05/03/26.
//

import SwiftUI

struct ProjectsModel: Identifiable {
    let id = UUID()
    var title: String
    var subtitle:String
    var description: String?
}
