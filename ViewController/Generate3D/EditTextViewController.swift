//
//  EditTextViewController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/05/18.
//

import UIKit

class EditTextViewController: UIViewController {
    let editTextView = EditTextView()
    let keyData: String
    
    init(key: String) {
        self.keyData = key
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        editTextView.initViews(self.view)
        editTextView.tv_keyword.text = self.keyData
        editTextView.btn_generate.addTarget(self, action: #selector(didTapGenerateBtn), for: .touchUpInside)
    }
    
    @objc func didTapGenerateBtn(_ sender: UIButton) {
        self.navigationController?.pushViewControllerTabHidden(LoadingViewController(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
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
