//
//  EditTextViewController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/05/18.
//

import UIKit
import RxSwift

class EditTextViewController: UIViewController {
    let editTextView = EditTextView()
    var keyData: String
    
    init(key: String) {
        self.keyData = key
        super.init(nibName: nil, bundle: nil)
    }
    
    init(image: UIImage) {
        let ocr = OCR()
        self.keyData = ""
        super.init(nibName: nil, bundle: nil)
        
        ocr.recognizeText(image: image, completion: { [weak self] result in
            self?.keyData = result
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setNavigationCustom(title: "")
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapBackBtn))
        
        editTextView.initViews(self.view)
        editTextView.tv_keyword.text = self.keyData
        editTextView.btn_generate.addTarget(self, action: #selector(didTapGenerateBtn), for: .touchUpInside)
    }
    
    @objc func didTapGenerateBtn(_ sender: UIButton) {
        self.keyData = self.editTextView.tv_keyword.text
        self.navigationController?.pushViewControllerTabHidden(LoadingViewController(key: self.keyData), animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func didTapBackBtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
