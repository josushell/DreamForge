//
//  BookDetailViewController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit
import Alamofire
import SWXMLHash

class BookDetailViewController: UIViewController {
    let bookDetailView = BookDetailView()
    var isbn: String = ""
    
    init(bookIsbn: String) {
        self.isbn = bookIsbn
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        bookDetailView.initViews(view: self.view)
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .main
        
        getBookDetailInfo(isbn: self.isbn)
    }
    
    func getBookDetailInfo(isbn: String) {
        let url = "https://openapi.naver.com/v1/search/book_adv.xml"
        let params = ["d_isbn": isbn,
                      "display":"10",
                      "start": "1"]
        let header: HTTPHeaders = ["Content-Type": "text/xml;charset=utf-8",
                      "X-Naver-Client-Id":"NiY4h3mNnqwmdm_rH0qR",
                      "X-Naver-Client-Secret":"YPcCCtLA5f"]

        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default,
                   headers: header).responseData { [weak self] response in
            switch response.result {
            case .success(let data) :
                let xml = XMLHash.parse(data)
                
                if let title = xml["rss"]["channel"]["item"]["title"].element?.text {
                    self?.bookDetailView.label_title.text = title
                }
                
                if let author = xml["rss"]["channel"]["item"]["author"].element?.text {
                    self?.bookDetailView.label_author.text = author
                }
                
                if let image = xml["rss"]["channel"]["item"]["image"].element?.text {
                    self?.bookDetailView.img_book.setImageUrl(url: image)
                }
                
            default:
                print("failed to parsing xml")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
