//
//  ConfirmViewController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/26.
//

import UIKit
import Alamofire
import SWXMLHash

class ConfirmViewController: UIViewController {
    let confirmView = ConfirmView()
    var isbn: String = ""
    var bookTitle: String = ""
    var bookAuthor: String = ""
    var BookImage: String = ""
    
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
        
        confirmView.initViews(superView: self.view)
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.tintColor = .main
        
        let registerBarBtn = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(didTapConfirmBtn))
        registerBarBtn.tintColor = .darkMain
        self.navigationItem.rightBarButtonItem = registerBarBtn
         
        getBookDetailInfo(isbn: self.isbn)
    }
    
    @objc func didTapConfirmBtn(_ sender: UIBarButtonItem) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.bookItems.append(Book(isbn: self.isbn, title: self.bookTitle, author: self.bookAuthor, image: self.BookImage))
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func getBookDetailInfo(isbn: String) {
        let url = "https://openapi.naver.com/v1/search/book_adv.xml"
        let params = ["d_isbn": isbn,
                      "display":"1",
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
                    self?.confirmView.titleLabel.text = title
                    self?.bookTitle = title
                }
                
                if let author = xml["rss"]["channel"]["item"]["author"].element?.text {
                    self?.confirmView.authorLabel.text = author
                    self?.bookAuthor = author
                }
                
                if let publisher = xml["rss"]["channel"]["item"]["publisher"].element?.text {
                    self?.confirmView.publisherLabel.text = "출판사  \(publisher)"
                }
                
                if let pubdate = xml["rss"]["channel"]["item"]["pubdate"].element?.text {
                    self?.confirmView.publisherLabel.text?.append("  출판일  \(pubdate)")
                }
                
                if let image = xml["rss"]["channel"]["item"]["image"].element?.text {
                    self?.confirmView.imageView.setImageUrl(url: image)
                    self?.BookImage = image
                }
                
                if let description = xml["res"]["channel"]["item"]["description"].element?.text {
                    self?.confirmView.descriptionTextView.text = description
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
