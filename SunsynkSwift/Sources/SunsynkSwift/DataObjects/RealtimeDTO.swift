//
//  RealtimeDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 16/08/2025.
//

import Foundation

public struct RealtimeDTO: Codable {
    public let code: Int
    public let msg: String
    public let success: Bool
    public let data: DataDTO?
}

public struct DataDTO: Codable {
    public let pac: Int?
    public let etoday: Float?
    public let emonth: Float?
    public let eyear: Float?
    public let etotal: Float?
    public let income: Float?
    public let efficiency: Float?
    public let updateAt: Date?
    public let currency: CurrencyDTO?
    public let totalPower: Float?
}

public struct CurrencyDTO: Codable {
    public let id: Int?
    public let code: String?
    public let text: String?
}
