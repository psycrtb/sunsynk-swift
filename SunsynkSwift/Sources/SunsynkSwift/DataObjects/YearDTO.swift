//
//  YearDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 21/08/2025.
//

import Foundation

struct YearDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: YearDataDTO
}

struct YearDataDTO: Codable {
    let infos: [YearInfoDTO]
}

struct YearInfoDTO: Codable {
    let unit: String
    let label: String
    let records: [YearInfoRecordDTO]
}

struct YearInfoRecordDTO: Codable {
    let time: String
    let value: String
}
