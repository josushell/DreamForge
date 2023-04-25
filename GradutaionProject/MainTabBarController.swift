//
//  MainTabBarController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tabBar.tintColor = .white
        tabBar.tintColor = .main
        tabBar.unselectedItemTintColor = .lightGray
        UITabBar.appearance().shadowImage = UIImage().withTintColor(.lightGray)

        setViewController()
    }
    
    private func setViewController() {
        let first = UINavigationController(rootViewController: MyLibTabController())
        let firstBarItem = UITabBarItem(title: "나의 서재", image: UIImage(named: "mylib"), tag: 1)
        first.tabBarItem = firstBarItem
        first.tabBarItem.selectedImage = UIImage(named: "mylib_selected")
        
        let second = UINavigationController(rootViewController: Generate3DTabController())
        let secondBarItem = UITabBarItem(title: "3D 생성", image: UIImage(named: "generate3d"), tag: 2)
        second.tabBarItem = secondBarItem
        second.tabBarItem.selectedImage = UIImage(named: "generate3d_selected")
        
        let third = UINavigationController(rootViewController: MyPageTabController())
        let thirdBarItem = UITabBarItem(title: "마이 페이지", image: UIImage(named: "mypage"), tag: 3)
        third.tabBarItem = thirdBarItem
        third.tabBarItem.selectedImage = UIImage(named: "mypage_selected")
        
        self.viewControllers = [first, second, third]
        self.selectedIndex = 1
    }

}
