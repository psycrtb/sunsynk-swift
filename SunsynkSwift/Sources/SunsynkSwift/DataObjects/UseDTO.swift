//
//  UseDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 20/08/2025.
//

public struct UseDTO: Codable {
    public let code: Int
    public let msg: String
    public let success: Bool
    public let data: UseDataDTO?
}

public struct UseDataDTO: Codable {
    public let load: Float?
    public let pv: Float?
    public let batteryCharge: Float?
    public let gridSell: Float?
}
