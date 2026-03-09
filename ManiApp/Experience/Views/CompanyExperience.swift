//
//  LoginView.swift
//  ManiApp
//
//  Created by neumacbcp on 26/02/26.
//

import SwiftUI

struct CompanyExperienceItem: View {
    let item: ExperienceItemModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            Text(item.title)
                .font(.customFont(font: .medium, size: 16))

            Text(item.subtitle)
                .font(.customFont(font: .medium, size: 16))
                .foregroundColor(.gray)

            if let description = item.description, !description.isEmpty {
                Text(description)
                    .font(.customFont(font: .regular, size: 16))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    CompanyExperienceItem(item: ExperienceItemModel(title: "Primary", subtitle: "iOS", description: "year"))
}
