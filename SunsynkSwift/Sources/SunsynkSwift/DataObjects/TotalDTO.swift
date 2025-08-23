//
//  TotalDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 21/08/2025.
//

import Foundation

public struct TotalDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: TotalDataDTO?
}

public struct TotalDataDTO: Codable {
    let infos: [TotalInfoDTO] = []
}

public struct TotalInfoDTO: Codable {
    let unit: String?
    let label: String?
    let records: [TotalInfoRecordDTO] = []
}

public struct TotalInfoRecordDTO: Codable {
    let time: String?
    let value: String?
}
