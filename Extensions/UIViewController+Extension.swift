//
//  UIViewController+Extension.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/05/19.
//

import UIKit

extension UIViewController {
    func setNavigationCustom(title: String, tintColor: UIColor = .black) {
        self.navigationItem.title = title
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.tintColor = tintColor
    }
}
