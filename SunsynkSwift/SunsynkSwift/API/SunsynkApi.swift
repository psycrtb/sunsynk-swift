//
//  SunsynkApi.swift
//  SunsynkSwift
//
//  Created by Tim B on 15/08/2025.
//

import Foundation

struct SPath {
    static let token = "/oauth/token"
    static let realtime = "/api/v1/plant/___/realtime"
    static let plants = "/api/v1/plants" 
}

protocol SunsynkApi: GenericApi {

    func token(client_id: String,
               grant_type: String,
               source: String,
               username: String,
               password: String) async throws -> TokenResponseDTO

    func realtime(token: String, plantId: Int) async throws -> RealtimeDTO

    func plants(token: String) async throws -> PlantsDTO

    func request(path: String, queryItems: [String: String]) -> URLRequest?
}

extension SunsynkApi {
    func decoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
