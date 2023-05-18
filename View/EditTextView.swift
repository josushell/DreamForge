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
        label_subtitle.setTxtAttribute("조수연님이 검색하신 키워드가 다음이 맞나요?\n잘못된 곳을 수정해주세요", size: 12, weight: .w500, txtColor: .lightGray)
        
    }
}
