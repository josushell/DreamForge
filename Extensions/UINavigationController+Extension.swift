//
//  UINavigationController+Extension.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit

// MARK: - Tab bar hidden 용 extension
extension UINavigationController {
    func pushViewControllerTabHidden(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        self.pushViewController(viewController, animated: animated)
    }
}
