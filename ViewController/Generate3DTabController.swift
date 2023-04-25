//
//  Generate3DTabController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit
import RxCocoa

class Generate3DTabController: UIViewController {
    let generate3DView = Generate3DView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generate3DView.initViews(self.view)
        generate3DView.btn_search.addTarget(self, action: #selector(didTapSearchBtn), for: .touchUpInside)
        generate3DView.btn_camera.addTarget(self, action: #selector(didTapCameraBtn), for: .touchUpInside)
        generate3DView.tf_search.delegate = self
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

// MARK: - Event Delegate
extension Generate3DTabController: UITextFieldDelegate {
    @objc func didTapSearchBtn(_ sender: UIButton) {
        print("search")
    }
    
    @objc func didTapCameraBtn(_ sender: UIButton) {
        print("camera")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
