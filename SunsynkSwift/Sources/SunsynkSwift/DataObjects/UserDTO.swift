//
//  UserDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 20/08/2025.
//

public struct UserDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: UserDataDTO?
}

public struct UserDataDTO: Codable {
    let id: Int?
    let nickname: String?
    let avatar: String?
    let gender: Int?
    let tempUnit: String?
}
