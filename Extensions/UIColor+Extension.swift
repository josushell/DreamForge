//
//  UIColor+Extension.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue:Int, a:Int = 1){
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0, alpha: CGFloat(a))
    }
    
    convenience init(Hex: Int){
        self.init(red: (Hex >> 16) & 0xFF, green: (Hex >> 8) & 0xFF,
                  blue: Hex & 0xFF)
    }
    convenience init(AHex: Int){
        self.init(red: (AHex >> 16) & 0xFF, green: (AHex >> 8) & 0xFF,
                  blue: AHex & 0xFF, a: (AHex >> 24) & 0xFF)
    }
    
    static let main = UIColor(Hex: 0x8F775C)
    static let background = UIColor(Hex: 0xFFFAF6)
    static let darkMain = UIColor(Hex: 0x703F30)
    static let textGray = UIColor(Hex: 0x434343)
    static let lightGray = UIColor(Hex: 0x979797)
    static let lineGray = UIColor(Hex: 0xDFDFDF)
}
