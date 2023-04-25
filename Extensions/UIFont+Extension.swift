//
//  UIFont+Extension.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit

extension UIFont {
    static func suit(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "SUIT"

        var weightString: String
        switch weight {
        case .bold:
            weightString = "Bold"
        case .heavy:
            weightString = "ExtraBold"
        case .ultraLight:
            weightString = "ExtraLight"
        case .light:
            weightString = "Light"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        case .thin:
            weightString = "Thin"
        default:
            weightString = "Regular"
        }

        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
    }
}

extension UIFont.Weight {
    /// regular
    static var w400: UIFont.Weight { .regular }
    /// medium
    static var w500: UIFont.Weight { .medium }
    /// semibold
    static var w600: UIFont.Weight { .semibold }
    /// bold
    static var w700: UIFont.Weight { .bold }
}

