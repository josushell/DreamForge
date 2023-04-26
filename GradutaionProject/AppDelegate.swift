//
//  AppDelegate.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/03/29.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var bookItems: [Book] = [
        Book(isbn: "9788976041487", title: "셜록 홈즈 전집 1: 진홍색 연구", author: "아서 코난 도일", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788976041487.jpg"),
        Book(isbn: "9788976041494", title: "셜록 홈즈 전집 2: 네 개의 서명", author: "아서 코난 도일", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788976041494.jpg"),
        Book(isbn: "9788937427831", title: "돌연한 출발", author: "프란츠 카프카", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788937427831.jpg"),
        Book(isbn: "9788925556284", title: "몰입 합본판", author: "황농문", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788925556284.jpg"),
        Book(isbn: "9791190299770", title: "모든 삶은 흐른다", author: "로랑스 드빌레르", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791190299770.jpg"),
        Book(isbn: "9788933871942", title: "엣지, 한 끗의 차이를 만드는 내 안의 힘", author: "로라 후앙", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788933871942.jpg"),
        Book(isbn: "9788976041487", title: "셜록 홈즈 전집 1: 진홍색 연구", author: "아서 코난 도일", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788976041487.jpg"),
        Book(isbn: "9788976041494", title: "셜록 홈즈 전집 2: 네 개의 서명", author: "아서 코난 도일", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788976041494.jpg"),
        Book(isbn: "9788937427831", title: "돌연한 출발", author: "프란츠 카프카", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788937427831.jpg"),
        Book(isbn: "9791190299770", title: "모든 삶은 흐른다", author: "로랑스 드빌레르", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791190299770.jpg"),
        Book(isbn: "9788933871942", title: "엣지, 한 끗의 차이를 만드는 내 안의 힘", author: "로라 후앙", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788933871942.jpg"),
        Book(isbn: "9788976041487", title: "셜록 홈즈 전집 1: 진홍색 연구", author: "아서 코난 도일", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788976041487.jpg")]


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        sleep(1)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

