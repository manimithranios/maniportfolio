//
//  CustomUI.swift
//  ManiApp
//
//  Created by neumacbcp on 02/03/26.
//

import SwiftUI

struct CustomUI: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CustomUI()
}



struct CustomTextField: View {
    var placeHolder: String
    var imageName: String
    var bColor: String
    var tOpacity: Double
    @Binding var value: String
    var body: some View{
        HStack{
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading, 20)
                .foregroundColor(Color.textColor)
            if(placeHolder == "Password" || placeHolder == "Confirm Password"){
                ZStack(alignment: .leading,){
                    if value.isEmpty{
                        Text(placeHolder)
                            .foregroundColor(Color.textColor)
                            .padding(.leading, 12)
                            .font(.customFont(font: .medium, size: 16))

                    }
                    SecureField("", text: $value)
                        .padding(.leading, 12)
                        .font(.customFont(font: .medium, size: 16))
                        .frame(height: 45)
                        .autocapitalization(.none)
                        .foregroundColor(Color.textColor)

                        
                }
            }
            else {
                ZStack(alignment: .leading,){
                    if value.isEmpty{
                        Text(placeHolder)
                            .foregroundColor(Color.textColor)
                            .padding(.leading, 12)
                            .font(.customFont(font: .medium, size: 16))
                    }
                    TextField("", text: $value)
                        .padding(.leading, 12)
                        .font(.customFont(font: .medium, size: 16))
                        .frame(height: 45)
                        .autocapitalization(.none)
                        .foregroundColor(Color.textColor)
                    
                }
            }
        }
        .overlay(
            Divider()
                .overlay(Color.textColor.opacity(tOpacity))
                .padding(.horizontal, 20)
            ,alignment: .bottom
        )
        
    }
}


struct customButton: View {
    var title: String
    var bgColor: Color
    var body: some View {
        Text(title)
            .font(.customFont(font: .bold, size: 20))
            .frame(height: 60)
            .foregroundColor(.white)
            .frame(minWidth: 0,maxWidth: .infinity)
            .background(bgColor)
            .cornerRadius(16)
    }
}

struct CustomGradientButton<Background: ShapeStyle>: View {
    var title: String
    var background: Background

    var body: some View {
        Text(title)
            .font(.customFont(font: .bold, size: 20))
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(background)
            .cornerRadius(16)
    }
}

struct TopBarView: View {
    var backAction: () -> Void
    var body: some View {
        Button(action: {backAction()}, label: {
            Image(systemName: "chevron.backward")
                   .font(.title3)
                   .foregroundColor(.white)
                   .fontWeight(.bold)
        })
    }
}


struct BackgroundEllipse: View {
    var xOffset: CGFloat = 0
    var yOffset: CGFloat = 0
    var leadingPadding: CGFloat = 0
    var opacity: Double = 0.5
    
    var body: some View {
        Ellipse()
            .frame(width: 200, height: 200)
            .foregroundStyle(LinearGradient.brandGradient)
            .padding(.leading, leadingPadding)
            .offset(x: xOffset, y: yOffset)
            .opacity(opacity)
    }
}
