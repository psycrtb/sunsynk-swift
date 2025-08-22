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
               password: String) async throws(ApiError) -> TokenResponseDTO {
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
        } catch let error as ApiError {
            throw error
        } catch {
            throw .unknownError(description: "Unknown error occured")
        }
    }

    func realtime(token: String,
                  plantId: Int) async throws(ApiError) -> RealtimeDTO {
        do {
            let path = SPath.realtime.replacingOccurrences(of: "___", with: "\(plantId)")

            guard var request = request(path: path) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: RealtimeDTO.self, withRequest: request, withDecoder: decoder())
        } catch let error as ApiError {
            throw error
        } catch {
            throw .unknownError(description: "Unknown error occured")
        }
    }

    func plants(token: String,
                page: Int = 1,
                limit: Int = 10) async throws(ApiError) -> PlantsDTO {
        do {
            guard var request = request(path: SPath.plants, queryItems: ["page": "\(page)", "limit": "\(limit)"]) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: PlantsDTO.self, withRequest: request, withDecoder: decoder())
        } catch let error as ApiError {
            throw error
        } catch {
            throw .unknownError(description: "Unknown error occured")
        }
    }

    func user(token: String,
              language: String) async throws(ApiError) -> UserDTO {
        do {
            guard var request = request(path: SPath.user, queryItems: ["lan": language]) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: UserDTO.self, withRequest: request, withDecoder: decoder())
        } catch let error as ApiError {
            throw error
        } catch {
            throw .unknownError(description: "Unknown error occured")
        }
    }

    func flow(token: String,
              plantId: Int,
              date: Date) async throws(ApiError) -> FlowDTO {
        do {
            let path = SPath.flow.replacingOccurrences(of: "___", with: "\(plantId)")

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let formattedDate = formatter.string(from: date)
            guard var request = request(path: path, queryItems: ["date": formattedDate]) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: FlowDTO.self, withRequest: request, withDecoder: decoder())
        } catch let error as ApiError {
            throw error
        } catch {
            throw .unknownError(description: "Unknown error occured")
        }
    }

    func use(token: String,
             plantId: Int) async throws(ApiError) -> UseDTO {
        do {
            let path = SPath.use.replacingOccurrences(of: "___", with: "\(plantId)")

            guard var request = request(path: path) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: UseDTO.self, withRequest: request, withDecoder: decoder())
        } catch let error as ApiError {
            throw error
        } catch {
            throw .unknownError(description: "Unknown error occured")
        }
    }

    func day(token: String,
             language: String,
             plantId: Int,
             date: Date) async throws(ApiError) -> DayDTO {
        do {
            let path = SPath.day.replacingOccurrences(of: "___", with: "\(plantId)")

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let formattedDate = formatter.string(from: date)
            guard var request = request(path: path, queryItems: ["lan": language, "date": formattedDate]) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: DayDTO.self, withRequest: request, withDecoder: decoder())
        } catch let error as ApiError {
            throw error
        } catch {
            throw .unknownError(description: "Unknown error occured")
        }
    }

    func month(token: String,
               language: String,
               plantId: Int,
               date: Date) async throws(ApiError) -> MonthDTO {
        do {
            let path = SPath.month.replacingOccurrences(of: "___", with: "\(plantId)")

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM"
            let formattedDate = formatter.string(from: date)
            guard var request = request(path: path, queryItems: ["lan": language, "date": formattedDate]) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: MonthDTO.self, withRequest: request, withDecoder: decoder())
        } catch let error as ApiError {
            throw error
        } catch {
            throw .unknownError(description: "Unknown error occured")
        }
    }

    func year(token: String,
              language: String,
              plantId: Int,
              date: Date) async throws(ApiError) -> YearDTO {
        do {
            let path = SPath.year.replacingOccurrences(of: "___", with: "\(plantId)")

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            let formattedDate = formatter.string(from: date)
            guard var request = request(path: path, queryItems: ["lan": language, "date": formattedDate]) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: YearDTO.self, withRequest: request, withDecoder: decoder())
        } catch let error as ApiError {
            throw error
        } catch {
            throw .unknownError(description: "Unknown error occured")
        }
    }

    func total(token: String,
               language: String,
               plantId: Int,
               date: Date) async throws(ApiError) -> TotalDTO {
        do {
            let path = SPath.total.replacingOccurrences(of: "___", with: "\(plantId)")

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            let formattedDate = formatter.string(from: date)
            guard var request = request(path: path, queryItems: ["lan": language, "date": formattedDate]) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: TotalDTO.self, withRequest: request, withDecoder: decoder())
        } catch let error as ApiError {
            throw error
        } catch {
            throw .unknownError(description: "Unknown error occured")
        }
    }

    func inverters(token: String,
                   plantId: Int,
                   page: Int = 1,
                   limit: Int = 10,
                   type: Int = -2,
                   status: Int = -1) async throws(ApiError) -> InvertersDTO {
        do {
            let path = SPath.inverters.replacingOccurrences(of: "___", with: "\(plantId)")

            guard var request = request(path: path, queryItems: ["page": "\(page)",
                                                                 "limit": "\(limit)",
                                                                 "id": "\(plantId)",
                                                                 "type": "\(type)",
                                                                 "status": "\(status)"]) else {
                throw ApiError.requestFailed(description: "Couldn't create request")
            }

            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return try await fetch(type: InvertersDTO.self, withRequest: request, withDecoder: decoder())
        } catch let error as ApiError {
            throw error
        } catch {
            throw .unknownError(description: "Unknown error occured")
        }
    }

    internal func request(path: String, queryItems: [String: String] = [:]) -> URLRequest? {
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
