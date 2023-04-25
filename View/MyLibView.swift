//
//  MyLibView.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit
import SnapKit

class MyLibView {
    var layout_main = UIView()
    var label_mylib = UILabel()
    var label_bookcount = UILabel()
    var btn_addBook = UIButton()
    
    var layout_books: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 104, height: 184)
        
        let layout_books = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout_books.backgroundColor = .white
        layout_books.register(BookCollectionCell.self, forCellWithReuseIdentifier: "BookCollectionCell")
        layout_books.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 67, right: 8)
        layout_books.translatesAutoresizingMaskIntoConstraints = false
        
        return layout_books
    }()
    
    func initViews(superView: UIView) {
        superView.addSubview(layout_main)
    
        layout_main.snp.makeConstraints() { make in
            make.edges.equalTo(superView.safeAreaLayoutGuide)
        }
        layout_main.addSubviews(label_mylib, label_bookcount, btn_addBook, layout_books)
        
        label_mylib.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11)
            make.leading.equalToSuperview().offset(23)
        }
        label_mylib.setTxtAttribute("나의 서재", size: 18, weight: .w600, txtColor: .black)

        label_bookcount.snp.makeConstraints() { make in
            make.leading.equalTo(label_mylib.snp.trailing).offset(5)
            make.centerY.equalTo(label_mylib)
        }
        label_bookcount.setTxtAttribute("0", size: 14, weight: .w500, txtColor: .lightGray)
        
        btn_addBook.snp.makeConstraints { make in
            make.centerY.equalTo(label_mylib)
            make.trailing.equalToSuperview().inset(23)
        }
        btn_addBook.setImage(UIImage(named: "addIcon"), for: .normal)
        
        layout_books.snp.makeConstraints() { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(label_mylib.snp.bottom).offset(18)
            make.bottom.equalTo(superView.safeAreaLayoutGuide)
        }
    }
}

// MARK: - scroll view cell class
class BookCollectionCell: UICollectionViewCell {
    static let identifier = "BookCollectionCell"
    var bookID: String = ""
    let layout_img = UIImageView()
    let label_title = UILabel()
    let label_author = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(layout_img, label_title, label_author)
        layout_img.snp.makeConstraints() { make in
            make.leading.top.equalToSuperview()
            make.width.equalTo(104)
            make.height.equalTo(139)
        }
        layout_img.backgroundColor = .lightGray
        layout_img.layer.cornerRadius = 3
        layout_img.clipsToBounds = true
        
        label_title.snp.makeConstraints() { make in
            make.leading.equalToSuperview().offset(4)
            make.top.equalTo(layout_img.snp.bottom).offset(7)
            make.width.equalTo(103)
            make.height.equalTo(19)
        }
        label_title.setTxtAttribute("제목", size: 15, weight: .w600, txtColor: .black)
        label_title.lineBreakMode = .byTruncatingTail
        
        label_author.snp.makeConstraints() { make in
            make.leading.equalToSuperview().offset(4)
            make.top.equalTo(label_title.snp.bottom).offset(1)
            make.width.equalTo(103)
            make.height.equalTo(15)
        }
        label_author.setTxtAttribute("작가", size: 12, weight: .w500, txtColor: .textGray)
        label_author.lineBreakMode = .byTruncatingTail
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

