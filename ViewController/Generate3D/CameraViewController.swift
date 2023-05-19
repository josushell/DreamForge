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
        self.view.backgroundColor = .white
        
        setNavigationCustom(title: "사진 촬영하기")
        imgPicker.delegate = self
        imgPicker.sourceType = .camera
        imgPicker.allowsEditing = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.present(imgPicker, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.imgPicker.dismiss(animated: true)
        
        guard let userPickedImage = info[.originalImage] as? UIImage else {
            fatalError("image nil")
        }
        
        let ocr = VisionViewController(img: userPickedImage)
        self.navigationController?.pushViewController(ocr, animated: true)
    }
}
