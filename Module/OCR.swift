//
//  OCR.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/05/21.
//

import UIKit
import Vision
import VisionKit

class OCR {
    func recognizeText(image: UIImage?, completion: @escaping ((String) -> Void)){
        guard let cgImage = image?.cgImage else {
            fatalError("could not get image")
        }
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let request = VNRecognizeTextRequest{ request, error in
            
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else{
                return
            }
            
            let text = observations.compactMap({
                $0.topCandidates(1).first?.string
            }).joined(separator: "\n")

            DispatchQueue.main.async {
                completion(text)
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
            print(error)
        }
    }
}
