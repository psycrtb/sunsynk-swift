//
//  MonthDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 21/08/2025.
//

import Foundation

struct MonthDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: MonthDataDTO
}

struct MonthDataDTO: Codable {
    let infos: [MonthInfoDTO]
}

struct MonthInfoDTO: Codable {
    let unit: String
    let label: String
    let records: [MonthInfoRecordDTO]
}

struct MonthInfoRecordDTO: Codable {
    let time: String
    let value: String
}
