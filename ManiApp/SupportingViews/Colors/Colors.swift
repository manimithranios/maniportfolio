//
//  Colors.swift
//  ManiApp
//
//  Created by neumacbcp on 26/02/26.
//

import SwiftUI

extension Color{
    static let primaryColor = Color(hex: "1A44D4")
    static let secondaryColor = Color(hex: "F2F2F7")
    static let textColor = Color(hex: "696767")
    static let placeholderColor = Color(hex: "E9E9E9")
    static let whiteColor = Color(hex: "FFFFFF")
    static let blackColor = Color(hex: "000000")

    static let lightCColor = Color(hex: "00C2E0")


}
extension LinearGradient {
    static let brandGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(hex: "1A44D4"), // Deep Blue
            Color(hex: "00C2E0"), // Vibrant Cyan
            Color(hex: "77D9A1")  // Soft Mint
        ]),
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
