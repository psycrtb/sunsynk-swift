//
//  MonthDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 21/08/2025.
//

import Foundation

public struct MonthDTO: Codable {
    public let code: Int
    public let msg: String
    public let success: Bool
    public let data: MonthDataDTO?
}

public struct MonthDataDTO: Codable {
    public let infos: [MonthInfoDTO] = []
}

public struct MonthInfoDTO: Codable {
    public let unit: String?
    public let label: String?
    public let records: [MonthInfoRecordDTO] = []
}

public struct MonthInfoRecordDTO: Codable {
    public let time: String?
    public let value: String?
}
