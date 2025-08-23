//
//  MonthDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 21/08/2025.
//

import Foundation

public struct MonthDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: MonthDataDTO?
}

public struct MonthDataDTO: Codable {
    let infos: [MonthInfoDTO] = []
}

public struct MonthInfoDTO: Codable {
    let unit: String?
    let label: String?
    let records: [MonthInfoRecordDTO] = []
}

public struct MonthInfoRecordDTO: Codable {
    let time: String?
    let value: String?
}
