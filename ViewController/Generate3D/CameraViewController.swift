//
//  CameraViewController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/05/19.
//

import UIKit
import SnapKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let imgPicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        setNavigationCustom(title: "사진 촬영하기", tintColor: .black)
        imgPicker.delegate = self
        imgPicker.sourceType = .camera
        imgPicker.allowsEditing = true
        
        self.present(imgPicker, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let userPickedImage = info[.originalImage] as? UIImage else {
            fatalError("image nil")
        }
        
        let ocr = EditTextViewController(image: userPickedImage)
        self.imgPicker.dismiss(animated: true, completion: { [weak self] in
            self?.navigationController?.pushViewController(ocr, animated: true)
        })
    }
}
