//
//  TokenDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 16/08/2025.
//

public struct TokenRequestDTO: Codable {
    let client_id: String
    let grant_type: String
    let password: String
    let source: String
    let username: String
}

public struct TokenResponseDTO: Codable {
    public let code: Int
    public let msg: String
    public let success: Bool
    public let data: TokenAccessDTO?
}

public struct TokenAccessDTO: Codable {
    public let access_token: String
    public let refresh_token: String
    public let scope: String
    public let token_type: String
    public let expires_in: Int
}
