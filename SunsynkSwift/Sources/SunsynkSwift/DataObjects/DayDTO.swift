//
//  DayDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 20/08/2025.
//

import Foundation

public struct DayDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: DayDataDTO?
}

public struct DayDataDTO: Codable {
    let infos: [DayInfoDTO] = []
}

public struct DayInfoDTO: Codable {
    let unit: String?
    let label: String?
    let records: [DayInfoRecordDTO] = []
}

public struct DayInfoRecordDTO: Codable {
    let time: String?
    let value: String?
}
