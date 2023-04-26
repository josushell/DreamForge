//
//  BookDetailView.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/26.
//

import UIKit
import SnapKit

// MARK: - 책 세부 내용 화면 layout class
class BookDetailView {
    var layout_main = UIView()
    var layout_horizontal = UIView()
    var layout_book = UIView()
    var img_book = UIImageView()
    
    var label_title = UILabel()
    var label_author = UILabel()
    
    var label_untilFin = UILabel()
    var label_untilFin_data = UILabel()
    
    var label_nowpage_data = UILabel()
    var label_totalpage_data = UILabel()
    var layout_progress = UIProgressView()
    
    var label_zero = UILabel()
    var label_hundred = UILabel()
    
    var btn_pageinput = UIButton()
    
    var label_history = UILabel()
    let label_history1 = UIPaddingLabel(radius: 8, color: .darkMain, verticalInset: 4, horizontalInset: 9)
    let label_history2 = UIPaddingLabel(radius: 8, color: .darkMain, verticalInset: 4, horizontalInset: 9)
    let label_history3 = UIPaddingLabel(radius: 8, color: .darkMain, verticalInset: 4, horizontalInset: 9)
    
    func initViews(view: UIView) {
        initViews_part1(view: view)
    }
    
    private func initViews_part1(view: UIView) {
        view.addSubview(layout_main)
        layout_main.snp.makeConstraints() { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        layout_main.addSubviews(layout_horizontal, layout_book, label_title, label_author, label_untilFin, label_untilFin_data, label_totalpage_data, label_nowpage_data, label_zero, label_hundred, btn_pageinput, layout_progress, label_zero, label_hundred, label_history, label_history1, label_history2, label_history3)
        layout_horizontal.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(23)
            make.centerX.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(5)
        }
        layout_horizontal.layer.cornerRadius = 3
        layout_horizontal.clipsToBounds = false
        layout_horizontal.layer.borderColor = UIColor.black.cgColor
        layout_horizontal.backgroundColor = UIColor(Hex: 0xDFDFDF)
        
        layout_book.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(37)
            make.width.equalTo(170)
            make.height.equalTo(247)
            make.centerX.equalToSuperview()
        }
        layout_book.layer.borderWidth = 1
        layout_book.layer.borderColor = UIColor.clear.cgColor
        layout_book.backgroundColor = .lightGray
        layout_book.layer.cornerRadius = 6
        layout_book.layer.shadowColor = UIColor.darkGray.cgColor
        layout_book.layer.shadowRadius = 3
        layout_book.layer.shadowOffset = CGSize(width: 1, height: 3)
        layout_book.layer.masksToBounds = false
        layout_book.layer.shadowOpacity = 0.5
        
        layout_book.addSubview(img_book)
        img_book.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
            make.size.equalToSuperview()
        }
        img_book.layer.cornerRadius = 6
        img_book.clipsToBounds = true
        img_book.translatesAutoresizingMaskIntoConstraints = false
        img_book.contentMode = .scaleAspectFill
        img_book.backgroundColor = .lightGray
        
        label_title.snp.makeConstraints() { make in
            make.top.equalTo(layout_book.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
        }
        label_title.setTxtAttribute("제목 정보가 없습니다.", size: 18, weight: .w600, txtColor: .black)
        label_title.textAlignment = .center
        
        label_author.snp.makeConstraints() { make in
            make.top.equalTo(label_title.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
        }
        label_author.setTxtAttribute("작가 정보가 없습니다.", size: 15, weight: .w500, txtColor: .textGray)
        label_author.textAlignment = .center
        
        label_untilFin.snp.makeConstraints() { make in
            make.leading.equalToSuperview().offset(23)
            make.top.equalTo(label_author.snp.bottom).offset(34)
        }
        label_untilFin.setTxtAttribute("완독까지", size: 14, weight: .w500, txtColor: .lightGray)
        
        label_untilFin_data.snp.makeConstraints() { make in
            make.leading.equalTo(label_untilFin.snp.trailing).offset(4)
            make.top.equalTo(label_untilFin)
        }
        label_untilFin_data.setTxtAttribute("42%", size: 14, weight: .w600, txtColor: .main)
        
        label_totalpage_data.snp.makeConstraints() { make in
            make.trailing.equalToSuperview().inset(23)
            make.top.equalTo(label_author.snp.bottom).offset(34)
        }
        label_totalpage_data.setTxtAttribute("/ 354", size: 17, weight: .w600, txtColor: .lightGray)
        
        label_nowpage_data.snp.makeConstraints() { make in
            make.trailing.equalTo(label_totalpage_data.snp.leading).offset(-4)
            make.top.equalTo(label_totalpage_data)
        }
        label_nowpage_data.setTxtAttribute("120", size: 17, weight: .w600, txtColor: .main)
        
        layout_progress.snp.makeConstraints() { make in
            make.top.equalTo(label_untilFin.snp.bottom).offset(11)
            make.leading.equalTo(label_untilFin)
            make.trailing.equalTo(label_totalpage_data)
            make.height.equalTo(7)
        }
        layout_progress.progressTintColor = .main
        layout_progress.trackTintColor = .lineGray
        layout_progress.setProgress(0.42, animated: true)
        layout_progress.clipsToBounds = true
        layout_progress.layer.cornerRadius = 3
        
        label_zero.snp.makeConstraints() { make in
            make.leading.equalTo(layout_progress)
            make.top.equalTo(layout_progress.snp.bottom).offset(5)
        }
        label_zero.setTxtAttribute("0", size: 11, weight: .w500, txtColor: .textGray)
        
        label_hundred.snp.makeConstraints() { make in
            make.trailing.equalTo(label_totalpage_data)
            make.top.equalTo(label_zero)
        }
        label_hundred.setTxtAttribute("100", size: 11, weight: .w500, txtColor: .textGray)
        
        btn_pageinput.snp.makeConstraints() { make in
            make.top.equalTo(label_zero.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalTo(140)
            make.height.equalTo(40)
        }
        btn_pageinput.setTitle("페이지 입력", size: 16, weight: .w600, color: .white)
        btn_pageinput.backgroundColor = .main
        btn_pageinput.layer.cornerRadius = 20
        btn_pageinput.clipsToBounds = true
        
        label_history.snp.makeConstraints { make in
            make.top.equalTo(btn_pageinput.snp.bottom).offset(38)
            make.leading.equalToSuperview().offset(32)
        }
        label_history.setTxtAttribute("키워드 조회 기록", size: 15, weight: .w600, txtColor: .textGray)
        
        label_history1.snp.makeConstraints { make in
            make.leading.equalTo(label_history)
            make.top.equalTo(label_history.snp.bottom).offset(10)
        }
        label_history1.setTxtAttribute("기차역", size: 13, weight: .w600, txtColor: .white)
        
        label_history2.snp.makeConstraints { make in
            make.leading.equalTo(label_history1.snp.trailing).offset(14)
            make.top.equalTo(label_history1)
        }
        label_history2.setTxtAttribute("열차", size: 13, weight: .w600, txtColor: .white)
        
        label_history3.snp.makeConstraints { make in
            make.leading.equalTo(label_history2.snp.trailing).offset(14)
            make.top.equalTo(label_history1)
        }
        label_history3.setTxtAttribute("유령", size: 13, weight: .w600, txtColor: .white)
    }
  
}
