//
//  UILabel+Extension.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit

// MARK: - UILabel extension
extension UILabel {
    func setTxtAttribute(_ title: String, size: CGFloat, weight: UIFont.Weight, txtColor: UIColor) {
        self.text = title
        self.font = .suit(size: size, weight: weight)
        self.textColor = txtColor
    }
}
