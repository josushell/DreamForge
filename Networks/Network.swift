//
//  Network.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/11.
//

import UIKit
import RxSwift
import Alamofire

class Network {
    func getOpenJourneyModel(keyword: String) -> Observable<UIImage?> {
        return Observable<UIImage?>.create { observer in
            let url = "https://api-inference.huggingface.co/models/prompthero/openjourney"
            let param = ["inputs" : keyword]
            let header : HTTPHeaders = [
                    "Authorization" : "Bearer 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"
               ]
            AF.request(url, method: .post, parameters: param, encoding: URLEncoding.default, headers: header).responseData { response in
                switch response.result {
                case .success(let img):
                    observer.onNext(UIImage(data: img))
                    observer.onCompleted()
                case .failure(let e):
                    print(e)
                    observer.onError(e)
                }
            }
            
            return Disposables.create {}
        }.asObservable()
    }
    
    func getObjectData(keyword: String) -> Observable<String> {
        return Observable<String>.create { observer in
            let url = "https://openai-point-e.hf.space/run/predict"
            let param = ["data" : [keyword]]
            let header : HTTPHeaders = [
                    "Content-Type" : "application/json"
               ]
            AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: header).responseDecodable(of: ObjectData.self, completionHandler: { response in
                switch response.result {
                case .success(let data):
                    observer.onNext(data.data[0].plot)
                    observer.onCompleted()
                case .failure(let e):
                    print(e)
                    observer.onError(e)
                }
            })
            
            return Disposables.create {}
        }.asObservable()
    }
    
    func translateKoTOEn(text: String) -> Observable<String> {
        return Observable<String>.create { observer in
            let url = "https://openapi.naver.com/v1/papago/n2mt"
            let params = ["source":"ko",
                          "target":"en",
                          "text": text]
            let header: HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded; charset=UTF-8",
                                       "X-Naver-Client-Id":"NiY4h3mNnqwmdm_rH0qR",
                                       "X-Naver-Client-Secret":"YPcCCtLA5f"]
            
            AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default,
                       headers: header).responseDecodable(of: Translator.self, completionHandler: { response in
                switch response.result {
                case .success(let data):
                    observer.onNext(data.message.result.translatedText)
                    observer.onCompleted()
                case .failure(let e):
                    print(e)
                    observer.onError(e)
                }
            })
            
            return Disposables.create {}
        }.asObservable()
    }
}
