//
//  UIView+Extension.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit

extension UIView {
    func addSubviews(_ view: UIView...) {
        view.forEach {
            self.addSubview($0)
        }
    }
}
