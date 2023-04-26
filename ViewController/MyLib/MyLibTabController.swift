//
//  MyLibTabController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit
import RxCocoa
import RxSwift

class MyLibTabController: UIViewController {
    let myLibView = MyLibView()
    var items = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.items = appDelegate.bookItems
        }
        
        myLibView.initViews(superView: self.view)
        
        myLibView.layout_books.delegate = self
        myLibView.layout_books.dataSource = self
        myLibView.btn_addBook.addTarget(self, action: #selector(didTapAddBookBtn), for: .touchUpInside)
        myLibView.label_bookcount.text = "\(self.items.count)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.items = appDelegate.bookItems
        }
        self.myLibView.layout_books.reloadData()
        print(self.items)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func didTapAddBookBtn(_ sender: UIButton) {
        self.navigationController?.pushViewControllerTabHidden(AddBookViewController(), animated: true)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MyLibTabController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionCell", for: indexPath) as? BookCollectionCell else {
            return BookCollectionCell()
        }
        
        let book = self.items[indexPath.row]
        
        cell.bookID = book.isbn
        cell.label_title.text = book.title
        cell.label_author.text = book.author
        cell.layout_img.setImageUrl(url: book.image)
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = collectionView.cellForItem(at: indexPath) as? BookCollectionCell else {
            return
        }
        
        let vc = BookDetailViewController(bookIsbn: item.bookID)
        self.navigationController?.pushViewControllerTabHidden(vc, animated: true)
    }
}
