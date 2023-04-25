//
//  Network.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/11.
//

import Foundation
import Alamofire

class Network {
    func translateKoTOEn(text: String) {
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
                print(data.message.result.translatedText)
            case .failure(let e):
                print(e)
            }
        })
    }
}
