//
//  LoginViewController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit

class LoginViewController: UIViewController {
    private let img_logo = UIImageView()
    private let btn_apple = UIButton()
    private let btn_email = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
        setUpBaseView()
    }
    
    private func setUpBaseView() {
        self.view.addSubviews(img_logo, btn_apple, btn_email)
        
        img_logo.snp.makeConstraints { make in
            make.width.equalTo(276)
            make.height.equalTo(322)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }
        img_logo.image = UIImage(named: "startImg")

        btn_apple.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(125)
            make.horizontalEdges.equalToSuperview().inset(26)
            make.height.equalTo(50)
        }
        btn_apple.layer.cornerRadius = 26
        btn_apple.clipsToBounds = true
        btn_apple.backgroundColor = .main
        btn_apple.setTitle("Sign in with Apple", size: 17, weight: .w600, color: .white)
        btn_apple.setImage(UIImage(systemName: "apple.logo"), tintColor: .white, padding: 12, direction: .leading)
        btn_apple.addTarget(self, action: #selector(didTapLoginBtn), for: .touchUpInside)
        
        btn_email.snp.makeConstraints { make in
            make.top.equalTo(btn_apple.snp.bottom).offset(17)
            make.horizontalEdges.equalToSuperview().inset(26)
            make.height.equalTo(50)
        }
        btn_email.layer.cornerRadius = 26
        btn_email.clipsToBounds = true
        btn_email.backgroundColor = .main
        btn_email.setTitle("Sign in with Email", size: 17, weight: .w600, color: .white)
        btn_email.setImage(UIImage(systemName: "envelope.fill"), tintColor: .white, padding: 12, direction: .leading)
        btn_email.addTarget(self, action: #selector(didTapLoginBtn), for: .touchUpInside)
    }
    
    @objc func didTapLoginBtn(_ sender: UIButton) {
        let vc = MainTabBarController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
