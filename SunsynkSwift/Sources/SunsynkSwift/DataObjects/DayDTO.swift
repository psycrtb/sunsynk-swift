//
//  DayDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 20/08/2025.
//

import Foundation

struct DayDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: DayDataDTO
}

struct DayDataDTO: Codable {
    let infos: [DayInfoDTO]
}

struct DayInfoDTO: Codable {
    let unit: String
    let label: String
    let records: [DayInfoRecordDTO]
}

struct DayInfoRecordDTO: Codable {
    let time: String
    let value: String
}
