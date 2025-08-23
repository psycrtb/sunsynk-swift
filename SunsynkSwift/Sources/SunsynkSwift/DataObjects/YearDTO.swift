//
//  YearDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 21/08/2025.
//

import Foundation

public struct YearDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: YearDataDTO?
}

public struct YearDataDTO: Codable {
    let infos: [YearInfoDTO] = []
}

public struct YearInfoDTO: Codable {
    let unit: String?
    let label: String?
    let records: [YearInfoRecordDTO] = []
}

public struct YearInfoRecordDTO: Codable {
    let time: String?
    let value: String?
}
