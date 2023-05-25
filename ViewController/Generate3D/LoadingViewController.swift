//
//  LoadingViewController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/05/19.
//

import UIKit
import RxSwift
import RxCocoa
import Lottie

class LoadingViewController: UIViewController {
    let label_title = UILabel()
    let label_subtitle = UILabel()
    let loadingAnimation = LottieAnimationView(name: "loading")
    var disposeBag = DisposeBag()
    
    let keyData: String
    
    init(key: String) {
        self.keyData = key
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setBaseView()
        
        getEngData()
    }
    
    private func setBaseView() {
        self.view.addSubviews(label_title, label_subtitle, loadingAnimation)
        label_title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }
        label_title.numberOfLines = 0
        label_title.textAlignment = .center
        label_title.setTxtAttribute("객체를 생성중이에요\n잠시만 기다려주세요", size: 20, weight: .w600, txtColor: .black)
        
        label_subtitle.snp.makeConstraints { make in
            make.top.equalTo(label_title.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        label_subtitle.setTxtAttribute("평균적으로 10초~20초 정도 소요될 예정이에요", size: 12, weight: .w500, txtColor: .lightGray)
        
        loadingAnimation.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(40)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        loadingAnimation.contentMode = .scaleAspectFit
        loadingAnimation.loopMode = .loop
        loadingAnimation.play()
    }
    
    private func getEngData() {
        print("get eng data")
        Network().translateKoTOEn(text: self.keyData)
            .subscribe(onNext: { [weak self] translatedData in
                print(translatedData)
                self?.get3DData(translatedData)
            })
            .disposed(by: disposeBag)
    }
    
    private func get3DData(_ keyword: String) {
        print("get 3d data")
        
        Network().getOpenJourneyModel(keyword: keyword)
            .subscribe(onNext: { [weak self] objectData in
                let vc = ObjectViewController(img: objectData)
                self?.navigationController?.pushViewControllerTabHidden(vc, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
        loadingAnimation.stop()
        disposeBag = DisposeBag()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
