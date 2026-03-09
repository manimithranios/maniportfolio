//
//  Fonts.swift
//  ManiApp
//
//  Created by neumacbcp on 27/02/26.
//

import SwiftUI

enum Poppins: String {
    case bold = "poppins-bold"
    case medium = "poppins-medium"
    case regular = "poppins-regular"
}
extension Font{
    static func customFont(font: Poppins, size:CGFloat)-> Font{
        custom(font.rawValue, size: size)
    }
}

extension CGFloat {
    static var screenWidth: CGFloat {
        UIApplication.shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?
            .bounds.width ?? 0
    }
    
    static var screenheght: CGFloat {
        UIApplication.shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?
            .bounds.height ?? 0
    }
}
