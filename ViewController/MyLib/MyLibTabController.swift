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
    let items: [Book] = [
        Book(isbn: "9788976041487", title: "셜록 홈즈 전집 1: 진홍색 연구", author: "아서 코난 도일", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788976041487.jpg"),
        Book(isbn: "9788976041494", title: "셜록 홈즈 전집 2: 네 개의 서명", author: "아서 코난 도일", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788976041494.jpg"),
        Book(isbn: "9788937427831", title: "돌연한 출발", author: "프란츠 카프카", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788937427831.jpg"),
        Book(isbn: "9788925556284", title: "몰입 합본판", author: "황농문", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788925556284.jpg"),
        Book(isbn: "9791190299770", title: "모든 삶은 흐른다", author: "로랑스 드빌레르", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791190299770.jpg"),
        Book(isbn: "9788933871942", title: "엣지, 한 끗의 차이를 만드는 내 안의 힘", author: "로라 후앙", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788933871942.jpg"),
        Book(isbn: "9788976041487", title: "셜록 홈즈 전집 1: 진홍색 연구", author: "아서 코난 도일", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788976041487.jpg"),
        Book(isbn: "9788976041494", title: "셜록 홈즈 전집 2: 네 개의 서명", author: "아서 코난 도일", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788976041494.jpg"),
        Book(isbn: "9788937427831", title: "돌연한 출발", author: "프란츠 카프카", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788937427831.jpg"),
        Book(isbn: "9788925556284", title: "몰입 합본판", author: "황농문", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788925556284.jpg"),
        Book(isbn: "9791190299770", title: "모든 삶은 흐른다", author: "로랑스 드빌레르", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791190299770.jpg"),
        Book(isbn: "9788933871942", title: "엣지, 한 끗의 차이를 만드는 내 안의 힘", author: "로라 후앙", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788933871942.jpg"),
        Book(isbn: "9788937427831", title: "돌연한 출발", author: "프란츠 카프카", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788937427831.jpg"),
        Book(isbn: "9788925556284", title: "몰입 합본판", author: "황농문", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788925556284.jpg"),
        Book(isbn: "9791190299770", title: "모든 삶은 흐른다", author: "로랑스 드빌레르", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791190299770.jpg"),
        Book(isbn: "9788933871942", title: "엣지, 한 끗의 차이를 만드는 내 안의 힘", author: "로라 후앙", image: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788933871942.jpg")]

    override func viewDidLoad() {
        super.viewDidLoad()
        myLibView.initViews(superView: self.view)
        
        myLibView.layout_books.delegate = self
        myLibView.layout_books.dataSource = self
        myLibView.btn_addBook.addTarget(self, action: #selector(didTapAddBookBtn), for: .touchUpInside)
        myLibView.label_bookcount.text = "\(self.items.count)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
