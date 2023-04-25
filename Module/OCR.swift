//
//  OCR.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/03/29.
//

import Foundation
import Vision
import VisionKit

class VisionViewController: UIViewController{
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "textImage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(imageView)
        
        recognizeText(image: imageView.image)
        
        print("VisionViewController")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.frame = CGRect(
            x: 20,
            y: view.safeAreaInsets.top,
            width: view.frame.size.width-40,
            height: view.frame.size.width-40)
        
        label.frame = CGRect(
            x: 20,
            y: view.frame.size.width + view.safeAreaInsets.top,
            width: view.frame.size.width-40,
            height: 300)
    }
    
    fileprivate func recognizeText(image: UIImage?){
        guard let cgImage = image?.cgImage else {
            fatalError("could not get image")
        }
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let request = VNRecognizeTextRequest{ [weak self]request, error in
            
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else{
                return
            }
            
            let text = observations.compactMap({
                $0.topCandidates(1).first?.string
            }).joined(separator: "\n")

            DispatchQueue.main.async {
                self?.label.text = text
                
                Network().translateKoTOEn(text: text)
            }
        }
   
        if #available(iOS 16.0, *) {
            let revision3 = VNRecognizeTextRequestRevision3
            request.revision = revision3
            request.recognitionLevel = .accurate
            request.recognitionLanguages =  ["ko-KR"]
            request.usesLanguageCorrection = true

            do {
                var possibleLanguages: Array<String> = []
                possibleLanguages = try request.supportedRecognitionLanguages()
                print(possibleLanguages)
            } catch {
                print("Error getting the supported languages.")
            }
        } else {
            // Fallback on earlier versions
            request.recognitionLanguages =  ["en-US"]
            request.usesLanguageCorrection = true
        }
    
        do{
            try handler.perform([request])
        } catch {
            label.text = "\(error)"
            print(error)
        }
    }
}


//import MLKitTextRecognitionKorean
//import MLKitVision
//import UIKit
//
//
//class OCR {
//    func getText(image: UIImage) {
//        let koreanOptions = KoreanTextRecognizerOptions()
//        let textRecognizer = TextRecognizer.textRecognizer(options: koreanOptions)
//        let visionImage = VisionImage(image: image)
//        visionImage.orientation = image.imageOrientation
//
//        textRecognizer.process(visionImage) { result, error in
//            guard error == nil, let result = result else {
//                //error handling
//                return
//            }
//            //결과값 출력
//            print(result.text)
//        }
//    }
//}
