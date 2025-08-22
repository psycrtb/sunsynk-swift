//
//  TokenDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 16/08/2025.
//

struct TokenRequestDTO: Codable {
    let client_id: String
    let grant_type: String
    let password: String
    let source: String
    let username: String
}

struct TokenResponseDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: TokenAccessDTO
}

struct TokenAccessDTO: Codable {
    let access_token: String
    let refresh_token: String
    let scope: String
    let token_type: String
    let expires_in: Int
}
