//
//  ProjectsItem.swift
//  ManiApp
//
//  Created by neumacbcp on 05/03/26.
//

import SwiftUI

struct ProjectsItem: View {
    let item: ProjectsModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            Text(item.title)
                .font(.customFont(font: .medium, size: 20))

            if let description = item.description, !description.isEmpty {
                Text(description)
                    .font(.customFont(font: .regular, size: 16))
//                    .foregroundColor(.gray)
            }
            
            Text(item.subtitle)
                .font(.customFont(font: .regular, size: 16))

        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    ProjectsItem(item: ProjectsModel(title: "", subtitle: "", description: ""))
}
