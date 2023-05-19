//
//  EditTextView.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/05/18.
//

import UIKit
import SnapKit

class EditTextView {
    let layout_main = UIView()
    let label_title = UILabel()
    let label_subtitle = UILabel()
    let tv_keyword = UITextView()
    let btn_generate = UIButton()
    
    func initViews(_ superView: UIView) {
        superView.addSubviews(layout_main)
        layout_main.snp.makeConstraints { make in
            make.edges.equalTo(superView.safeAreaLayoutGuide)
        }
        layout_main.addSubviews(label_title, label_subtitle, tv_keyword, btn_generate)
        
        label_title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview().offset(25)
        }
        label_title.setTxtAttribute("키워드를 인식했어요", size: 18, weight: .w600, txtColor: .black)
        
        label_subtitle.snp.makeConstraints { make in
            make.top.equalTo(label_title.snp.bottom).offset(10)
            make.leading.equalTo(label_title)
        }
        label_subtitle.numberOfLines = 0
        label_subtitle.setTxtAttribute("조수연님이 검색하신 키워드가 다음이 맞나요?\n잘못된 곳을 수정해주세요", size: 12, weight: .w500, txtColor: .lightGray)
        
        btn_generate.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(29)
            make.bottom.equalToSuperview().inset(34)
            make.height.equalTo(50)
        }
        btn_generate.layer.cornerRadius = 26
        btn_generate.clipsToBounds = true
        btn_generate.backgroundColor = .main
        btn_generate.setTitle("3D 객체 생성하기", size: 17, weight: .w600, color: .white)
        btn_generate.setImage(UIImage(systemName: "arkit"), tintColor: .white, padding: 20, direction: .leading)
        
        tv_keyword.snp.makeConstraints { make in
            make.top.equalTo(label_subtitle.snp.bottom).offset(17)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalTo(btn_generate.snp.top).offset(-53)
        }
        tv_keyword.font = .suit(size: 18, weight: .w500)
        tv_keyword.textColor = .darkText
        tv_keyword.layer.cornerRadius = 20
        tv_keyword.textContainerInset = UIEdgeInsets(top: 30, left: 25, bottom: 30, right: 25)
        tv_keyword.textAlignment = .justified
        tv_keyword.layer.borderWidth = 1
        tv_keyword.layer.borderColor = UIColor.main.cgColor
        tv_keyword.backgroundColor = .background
    }
}
