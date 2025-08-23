//
//  RealtimeDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 16/08/2025.
//

import Foundation

public struct RealtimeDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: DataDTO?
}

public struct DataDTO: Codable {
    let pac: Int?
    let etoday: Float?
    let emonth: Float?
    let eyear: Float?
    let etotal: Float?
    let income: Float?
    let efficiency: Float?
    let updateAt: Date?
    let currency: CurrencyDTO?
    let totalPower: Float?
}

public struct CurrencyDTO: Codable {
    let id: Int?
    let code: String?
    let text: String?
}
