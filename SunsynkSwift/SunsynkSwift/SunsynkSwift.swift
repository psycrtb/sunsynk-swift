//
//  SunsynkSwift.swift
//  SunsynkSwift
//
//  Created by Tim B on 14/08/2025.
//

import Foundation

final public class Sunsynk: SunsynkApi {

    private let scheme = "https"
    private let host = "api.sunsynk.net"

    let session: URLSession

    func token(client_id: String = "csp-web",
               grant_type: String = "password",
               source: String = "sunsynk",
               username: String,
               password: String) async throws -> TokenResponseDTO {
        do {
            let tokenRequest = TokenRequestDTO(client_id: client_id,
                                               grant_type: grant_type,
                                               password: password,
                                               source: source,
                                               username: username)

            guard var request = request(path: SPath.token) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"

            let data = try JSONEncoder().encode(tokenRequest)
            request.httpBody = data

            return try await fetch(type: TokenResponseDTO.self, withRequest: request, withDecoder: decoder())
        } catch {
            throw error
        }
    }

    func realtime(token: String, plantId: Int) async throws -> RealtimeDTO {
        do {
            let path = SPath.realtime.replacingOccurrences(of: "___", with: "\(plantId)")

            guard var request = request(path: path) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: RealtimeDTO.self, withRequest: request, withDecoder: decoder())
        } catch {
            throw error
        }
    }

    func plants(token: String) async throws -> PlantsDTO {
        do {
            guard var request = request(path: SPath.plants, queryItems: ["page": "1", "limit": "10"]) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: PlantsDTO.self, withRequest: request, withDecoder: decoder())
        } catch {
            throw error
        }
    }

    func request(path: String, queryItems: [String: String] = [:]) -> URLRequest?  {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }

        if let url = components.url {
            return URLRequest(url: url)
        }
        return nil
    }

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }
}
