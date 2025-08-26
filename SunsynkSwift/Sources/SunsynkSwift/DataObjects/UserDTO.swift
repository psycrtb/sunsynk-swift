//
//  UserDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 20/08/2025.
//

public struct UserDTO: Codable {
    public let code: Int
    public let msg: String
    public let success: Bool
    public let data: UserDataDTO?
}

public struct UserDataDTO: Codable {
    public let id: Int?
    public let nickname: String?
    public let avatar: String?
    public let gender: Int?
    public let tempUnit: String?
}
