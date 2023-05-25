//
//  DataClass.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/11.
//

import Foundation

// MARK: - Translator
struct Translator: Decodable {
    let message: Message
}

// MARK: - Message
struct Message: Decodable {
    let result: Result
    let type, service, version: String

    enum CodingKeys: String, CodingKey {
        case result
        case type = "@type"
        case service = "@service"
        case version = "@version"
    }
}

// MARK: - Result
struct Result: Decodable {
    let srcLangType, tarLangType, translatedText, engineType: String
    let pivot, dict, tarDict: String?
}

import Foundation

// MARK: - Welcome
struct ObjectData: Decodable {
    let data: [PointData]
    let is_generating: Bool
    let duration, average_duration: Double
}

// MARK: - Datum
struct PointData: Decodable {
    let type, plot: String
}
