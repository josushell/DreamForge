//
//  UIButton+Extension.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit

// MARK: - UIButton extension
extension UIButton {
    func setTitle(_ title: String, size: CGFloat, weight: UIFont.Weight, color: UIColor, when: UIControl.State = .normal) {
        if #available(iOS 15.0, *) {
            var attributedTitle = AttributedString(title)
            attributedTitle.font = .suit(size: size, weight: weight)
            attributedTitle.foregroundColor = color
            var configuration = self.configuration ?? .plain()
            configuration.attributedTitle = attributedTitle
            self.configuration = configuration
        } else {
            self.setTitle(title, for: when)
            self.titleLabel?.font = .systemFont(ofSize: size, weight: weight)
            self.setTitleColor(color, for: when)
        }
    }
    
    func setImage(_ image: UIImage?, tintColor: UIColor, padding: CGFloat, direction: NSDirectionalRectEdge) {
        if #available(iOS 15.0, *) {
            var configuration = self.configuration ?? .plain()
            configuration.imagePadding = padding / 2
            configuration.image = image
            configuration.titlePadding = padding / 2
            configuration.imagePlacement = direction
            self.configuration = configuration
            self.tintColor = tintColor
        } else {
            self.setImage(image, for: .normal)
            self.tintColor = tintColor
            if direction == .trailing {
                self.semanticContentAttribute = .forceRightToLeft
                self.imageEdgeInsets = UIEdgeInsets(top: 0, left: padding / 2, bottom: 0, right: 0)
                self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: padding / 2)
            } else if direction == .leading {
                self.semanticContentAttribute = .forceLeftToRight
                self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: padding / 2)
                self.contentEdgeInsets = UIEdgeInsets(top: 0, left: padding / 2, bottom: 0, right: 0)
            }
        }
    }
}

