//
//  ExperienceItem.swift
//  ManiApp
//
//  Created by neumacbcp on 04/03/26.
//

import SwiftUI


struct ExperienceItem: View {
    let item: ExperienceItemModel
    
    var body: some View {
        HStack(alignment: .top) {
            Text(item.title)
                .font(.customFont(font: .medium, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(item.subtitle)
                .font(.customFont(font: .regular, size: 16))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .cornerRadius(12)
    }
}

#Preview {
    ExperienceItem(item: ExperienceItemModel(title: "Primary", subtitle: "iOS", imageName: ""))
}
