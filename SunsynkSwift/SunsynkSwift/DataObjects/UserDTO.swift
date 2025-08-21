//
//  UserDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 20/08/2025.
//

struct UserDTO: Codable {
    let code: Int
    let msg: String
    let data: UserDataDTO
    let success: Bool
}

struct UserDataDTO: Codable {
    let id: Int
    let nickname: String
    let avatar: String
    let gender: Int
    let tempUnit: String
}
