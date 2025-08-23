//
//  UseDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 20/08/2025.
//

public struct UseDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: UseDataDTO?
}

public struct UseDataDTO: Codable {
    let load: Float?
    let pv: Float?
    let batteryCharge: Float?
    let gridSell: Float?
}
