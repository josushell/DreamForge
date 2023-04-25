//
//  Generate3DView.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit
import SnapKit

class Generate3DView {
    let layout_main = UIView()
    
    let label_title = UILabel()
    let img_main = UIImageView()
    let label_description = UILabel()
    
    let label_search = UILabel()
    let tf_search = UITextField()
    let btn_search = UIButton()
    
    let label_camera = UILabel()
    let btn_camera = UIButton()
    
    let line = UIView()
    
    let label_history = UILabel()
    let label_detail = UILabel()
    
    let layout_history = UIView()
    let label_history1 = UIPaddingLabel(radius: 8, color: .darkMain, verticalInset: 4, horizontalInset: 9)
    let label_history2 = UIPaddingLabel(radius: 8, color: .darkMain, verticalInset: 4, horizontalInset: 9)
    let label_history3 = UIPaddingLabel(radius: 8, color: .darkMain, verticalInset: 4, horizontalInset: 9)
    let label_history4 = UIPaddingLabel(radius: 8, color: .darkMain, verticalInset: 4, horizontalInset: 9)
    let label_history5 = UIPaddingLabel(radius: 8, color: .darkMain, verticalInset: 4, horizontalInset: 9)
    
    func initViews(_ superView: UIView) {
        superView.addSubview(layout_main)
        layout_main.snp.makeConstraints { make in
            make.edges.equalTo(superView.safeAreaLayoutGuide)
        }
        
        layout_main.addSubviews(label_title, img_main, label_description, label_search, tf_search, label_camera, btn_camera, line, label_history, label_detail, layout_history)
        
        label_title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11)
            make.leading.equalToSuperview().offset(23)
        }
        label_title.setTxtAttribute("3D 객체 생성", size: 18, weight: .w600, txtColor: .black)
        
        img_main.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(29)
            make.centerX.equalToSuperview()
            make.width.equalTo(136)
            make.height.equalTo(103)
        }
        img_main.image = UIImage(named: "mainImg")
        
        label_description.snp.makeConstraints { make in
            make.top.equalTo(img_main.snp.bottom).offset(13)
            make.centerX.equalToSuperview()
        }
        label_description.setTxtAttribute("이미지를 떠올리기 어렵다면\n키워드를 검색해서 자유로움을 경험하세요", size: 12, weight: .w500, txtColor: .lightGray)
        label_description.textAlignment = .center
        label_description.numberOfLines = 0
        
        label_search.snp.makeConstraints { make in
            make.top.equalTo(label_description.snp.bottom).offset(58)
            make.leading.equalToSuperview().offset(26)
        }
        label_search.setTxtAttribute("키워드 직접 검색하기", size: 18, weight: .w600, txtColor: .textGray)
        
        tf_search.snp.makeConstraints { make in
            make.top.equalTo(label_search.snp.bottom).offset(13)
            make.horizontalEdges.equalToSuperview().inset(26)
            make.height.equalTo(50)
        }
        tf_search.layer.cornerRadius = 26
        tf_search.clipsToBounds = true
        tf_search.layer.borderColor = UIColor.main.cgColor
        tf_search.layer.borderWidth = 1
        tf_search.placeholder = "키워드를 입력하세요"
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 50))
        tf_search.leftView = paddingView
        tf_search.rightView = paddingView
        tf_search.leftViewMode = .always
        tf_search.rightViewMode = .always
        tf_search.textColor = .textGray
        tf_search.font = .suit(size: 14, weight: .w500)
        tf_search.addSubview(btn_search)
        tf_search.returnKeyType = .done
        btn_search.becomeFirstResponder()
        
        btn_search.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
        btn_search.setImage(UIImage(named: "searchIcon"), for: .normal)
        
        label_camera.snp.makeConstraints { make in
            make.top.equalTo(tf_search.snp.bottom).offset(33)
            make.leading.equalToSuperview().offset(26)
        }
        label_camera.setTxtAttribute("사진으로 검색하기", size: 18, weight: .w600, txtColor: .textGray)
        
        btn_camera.snp.makeConstraints { make in
            make.top.equalTo(label_camera.snp.bottom).offset(14)
            make.horizontalEdges.equalToSuperview().inset(26)
            make.height.equalTo(50)
        }
        btn_camera.layer.cornerRadius = 26
        btn_camera.clipsToBounds = true
        btn_camera.backgroundColor = .main
        btn_camera.setTitle("사진 촬영하기", size: 17, weight: .w600, color: .white)
        btn_camera.setImage(UIImage(named: "cameraIcon"), tintColor: .white, padding: 20, direction: .trailing)
        
        line.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.top.equalTo(btn_camera.snp.bottom).offset(50)
        }
        line.backgroundColor = .lineGray
        
        label_history.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(38)
            make.leading.equalToSuperview().offset(26)
        }
        label_history.setTxtAttribute("키워드 조회 기록", size: 18, weight: .w600, txtColor: .textGray)
        
        label_detail.snp.makeConstraints { make in
            make.top.equalTo(label_history.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(26)
        }
        label_detail.setTxtAttribute("조수연님이 최근에 찾아본 키워드에요", size: 12, weight: .w500, txtColor: .lightGray)
        
        layout_history.snp.makeConstraints { make in
            make.top.equalTo(label_detail.snp.bottom).offset(23)
            make.horizontalEdges.equalToSuperview().inset(26)
            make.bottom.equalToSuperview()
        }
        layout_history.addSubviews(label_history1, label_history2, label_history3, label_history4, label_history5)
        
        label_history1.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        label_history1.setTxtAttribute("기차역", size: 12, weight: .w600, txtColor: .white)
        
        label_history2.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(label_history1.snp.trailing).offset(16)
        }
        label_history2.setTxtAttribute("열차", size: 12, weight: .w600, txtColor: .white)
        
        label_history3.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(label_history2.snp.trailing).offset(16)
        }
        label_history3.setTxtAttribute("노란 자전거", size: 12, weight: .w600, txtColor: .white)
        
        label_history4.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(label_history3.snp.trailing).offset(16)
        }
        label_history4.setTxtAttribute("해바라기", size: 12, weight: .w600, txtColor: .white)
        
        label_history5.snp.makeConstraints { make in
            make.top.equalTo(label_history1.snp.bottom).offset(17)
            make.leading.equalToSuperview()
        }
        label_history5.setTxtAttribute("검은 고양이", size: 12, weight: .w600, txtColor: .white)
    }
}
