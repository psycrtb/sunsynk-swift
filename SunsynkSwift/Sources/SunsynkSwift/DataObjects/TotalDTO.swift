//
//  TotalDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 21/08/2025.
//

import Foundation

struct TotalDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: TotalDataDTO
}

struct TotalDataDTO: Codable {
    let infos: [TotalInfoDTO]
}

struct TotalInfoDTO: Codable {
    let unit: String
    let label: String
    let records: [TotalInfoRecordDTO]
}

struct TotalInfoRecordDTO: Codable {
    let time: String
    let value: String
}
