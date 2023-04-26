//
//  ConfirmView.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/26.
//

import UIKit
import SnapKit

class ConfirmView {
    let layout_book = UIView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let publisherLabel = UILabel()
    let label_summary = UILabel()
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    let descriptionTextView = UILabel()
    let showallButton = UIButton()
    let showShortButton = UIButton()
    let contentView = UIView()
    let divideView = UIView()
    let upperDivideView = UIView()
    
    func initViews(superView: UIView) {
        superView.addSubview(scrollView)
        superView.backgroundColor = .white
        
        scrollView.addSubview(contentView)
        contentView.addSubviews(layout_book, titleLabel, authorLabel, publisherLabel, descriptionTextView, showallButton, showShortButton, divideView, upperDivideView, label_summary)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.snp.makeConstraints() { make in
            make.edges.equalTo(superView.safeAreaLayoutGuide)
        }
        scrollView.contentLayoutGuide.snp.makeConstraints() { make in
            make.edges.equalTo(superView.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints() { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
        }
        
        upperDivideView.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(5)
            make.top.equalTo(contentView.snp.top).offset(32)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        upperDivideView.layer.cornerRadius = 2
        upperDivideView.backgroundColor = UIColor(Hex: 0xDFDFDF)
        
        layout_book.snp.makeConstraints() { make in
            make.top.equalTo(upperDivideView.snp.bottom).offset(11)
            make.width.equalTo(222)
            make.height.equalTo(307)
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
        layout_book.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalToSuperview()
        }
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lineGray
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(24)
        }
        titleLabel.setTxtAttribute("제목 정보가 없습니다.", size: 18, weight: .w600, txtColor: .black)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        authorLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(13)
        }
        authorLabel.setTxtAttribute("작가 정보가 없습니다.", size: 15, weight: .w600, txtColor: .textGray)
        authorLabel.numberOfLines = 0
        authorLabel.textAlignment = .center
        
        publisherLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(authorLabel.snp.bottom).offset(8)
        }
        publisherLabel.setTxtAttribute("출판사 정보가 없습니다.", size: 14, weight: .w500, txtColor: .textGray)
        publisherLabel.textAlignment = .center
        
        divideView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(1)
            make.top.equalTo(publisherLabel.snp.bottom).offset(47)
        }
        divideView.backgroundColor = .lineGray
        
        label_summary.snp.makeConstraints() { make in
            make.top.equalTo(divideView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(23)
        }
        label_summary.setTxtAttribute("줄거리", size: 15, weight: .w600, txtColor: .black)
        
        descriptionTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(23)
            make.top.equalTo(label_summary.snp.bottom).offset(15)
            make.height.equalTo(100)
        }
        descriptionTextView.setTxtAttribute("설명이 없습니다", size: 14, weight: .w500, txtColor: .lightGray)
        descriptionTextView.textAlignment = .justified
        descriptionTextView.numberOfLines = 0
        
        showallButton.snp.makeConstraints { make in
            make.trailing.equalTo(descriptionTextView.snp.trailing)
            make.top.equalTo(descriptionTextView.snp.bottom).offset(7)
        }
        showallButton.setTitle("전체보기", size: 11, weight: .w500, color: .textGray)
        showallButton.addTarget(self, action: #selector(didTapShowAll), for: .touchUpInside)
        
        showShortButton.snp.makeConstraints() { make in
            make.trailing.equalTo(descriptionTextView.snp.trailing)
            make.top.equalTo(descriptionTextView.snp.bottom).offset(7)
        }
        showShortButton.setTitle("닫기", size: 11, weight: .w500, color: .textGray)
        showShortButton.addTarget(self, action: #selector(didTapShowShort), for: .touchUpInside)
        showShortButton.isHidden = true
    }
    
    @objc func didTapShowAll(_ sender: UIButton) {
        self.showShortButton.isHidden = false
        sender.isHidden = true
        self.descriptionTextView.snp.remakeConstraints() { make in
            make.leading.trailing.equalToSuperview().inset(23)
            make.top.equalTo(label_summary.snp.bottom).offset(15)
            make.height.equalTo(self.descriptionTextView.intrinsicContentSize.height)
        }
        scrollView.contentLayoutGuide.snp.remakeConstraints() { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(self.scrollView.frame.height + self.descriptionTextView.frame.height + 50)
        }
    }
    
    @objc func didTapShowShort(_ sender: UIButton) {
        self.showallButton.isHidden = false
        sender.isHidden = true
        self.descriptionTextView.snp.remakeConstraints() { make in
            make.leading.trailing.equalToSuperview().inset(23)
            make.top.equalTo(label_summary.snp.bottom).offset(15)
            make.height.equalTo(100)
        }
        scrollView.contentLayoutGuide.snp.remakeConstraints() { make in
            make.edges.equalTo(scrollView.frameLayoutGuide)
        }
    }
}

