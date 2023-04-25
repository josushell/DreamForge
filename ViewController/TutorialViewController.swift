//
//  TutorialViewController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit

class TutorialViewController: UIViewController {
    private let img_logo = UIImageView()
    private let label_main = UILabel()
    private let img_mockup = UIImageView()
    private let btn_start = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
        setUpBaseView()
    }
    
    private func setUpBaseView() {
        self.view.addSubviews(img_logo, label_main, img_mockup, btn_start)
        
        img_logo.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(11)
            make.leading.equalToSuperview().offset(23)
            make.width.equalTo(136)
            make.height.equalTo(22)
        }
        img_logo.image = UIImage(named: "mainTextLogo")
        
        label_main.snp.makeConstraints { make in
            make.top.equalTo(img_logo.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }
        label_main.setTxtAttribute("책에서 필요한 부분을 촬영하여\nAR로 만나보세요", size: 20, weight: .w600, txtColor: .textGray)
        label_main.numberOfLines = 0
        label_main.textAlignment = .center
        
        img_mockup.snp.makeConstraints { make in
            make.top.equalTo(label_main.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        img_mockup.image = UIImage(named: "mainMockup")
        
        btn_start.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(60)
            make.horizontalEdges.equalToSuperview().inset(26)
            make.height.equalTo(50)
        }
        btn_start.layer.cornerRadius = 26
        btn_start.clipsToBounds = true
        btn_start.backgroundColor = .main
        btn_start.setTitle("시작하기", size: 17, weight: .w600, color: .white)
        btn_start.addTarget(self, action: #selector(didTapStartBtn), for: .touchUpInside)
    }
    
    @objc func didTapStartBtn(_ sender: UIButton) {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
