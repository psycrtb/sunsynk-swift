//
//  DayDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 20/08/2025.
//

import Foundation

public struct DayDTO: Codable {
    public let code: Int
    public let msg: String
    public let success: Bool
    public let data: DayDataDTO?
}

public struct DayDataDTO: Codable {
    public let infos: [DayInfoDTO] = []
}

public struct DayInfoDTO: Codable {
    public let unit: String?
    public let label: String?
    public let records: [DayInfoRecordDTO] = []
}

public struct DayInfoRecordDTO: Codable {
    public let time: String?
    public let value: String?
}
