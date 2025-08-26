//
//  TotalDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 21/08/2025.
//

import Foundation

public struct TotalDTO: Codable {
    public let code: Int
    public let msg: String
    public let success: Bool
    public let data: TotalDataDTO?
}

public struct TotalDataDTO: Codable {
    public let infos: [TotalInfoDTO] = []
}

public struct TotalInfoDTO: Codable {
    public let unit: String?
    public let label: String?
    public let records: [TotalInfoRecordDTO] = []
}

public struct TotalInfoRecordDTO: Codable {
    public let time: String?
    public let value: String?
}
