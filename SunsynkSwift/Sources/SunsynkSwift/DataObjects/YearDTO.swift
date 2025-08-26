//
//  YearDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 21/08/2025.
//

import Foundation

public struct YearDTO: Codable {
    public let code: Int
    public let msg: String
    public let success: Bool
    public let data: YearDataDTO?
}

public struct YearDataDTO: Codable {
    public let infos: [YearInfoDTO] = []
}

public struct YearInfoDTO: Codable {
    public let unit: String?
    public let label: String?
    public let records: [YearInfoRecordDTO] = []
}

public struct YearInfoRecordDTO: Codable {
    public let time: String?
    public let value: String?
}
