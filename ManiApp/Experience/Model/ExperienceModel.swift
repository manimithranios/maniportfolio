//
//  ExperienceModel.swift
//  ManiApp
//
//  Created by neumacbcp on 04/03/26.
//

import SwiftUI

struct ExperienceItemModel: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    var imageName: String?
    var description: String?

}
