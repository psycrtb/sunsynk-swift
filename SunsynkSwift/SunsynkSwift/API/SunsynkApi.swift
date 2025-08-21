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
    static let user = "/api/v1/user"
    static let flow = "/api/v1/plant/energy/___/flow"
    static let use = "/api/v1/plant/energy/___/generation/use"
    static let day = "/api/v1/plant/energy/___/day"
    static let month = "/api/v1/plant/energy/___/month"
    static let year = "/api/v1/plant/energy/___/year"
    static let total = "/api/v1/plant/energy/___/total"
}

protocol SunsynkApi: GenericApi {

    func token(client_id: String,
               grant_type: String,
               source: String,
               username: String,
               password: String) async throws -> TokenResponseDTO

    func realtime(token: String, plantId: Int) async throws -> RealtimeDTO

    func plants(token: String, page: Int, limit: Int) async throws -> PlantsDTO

    func user(token: String, language: String) async throws -> UserDTO

    func flow(token: String, plantId: Int, date: Date) async throws -> FlowDTO

    func use(token: String, plantId: Int) async throws -> UseDTO

    func day(token: String, language: String, plantId: Int, date: Date) async throws -> DayDTO

    func month(token: String, language: String, plantId: Int, date: Date) async throws -> MonthDTO

    func year(token: String, language: String, plantId: Int, date: Date) async throws -> YearDTO

    func total(token: String, language: String, plantId: Int, date: Date) async throws -> TotalDTO

    func request(path: String, queryItems: [String: String]) -> URLRequest?
}

extension SunsynkApi {
    func decoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
