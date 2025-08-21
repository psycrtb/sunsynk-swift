//
//  GenericApi.swift
//  SunsynkSwift
//
//  Created by Tim B on 15/08/2025.
//

import Foundation

enum ApiError: Error {
    case requestFailed(description: String)
    case invalidData
    case responseUnsuccessful(description: String)
    case jsonConversionFailure(description: String)
    case jsonParsingFailure
    case failedSerialization
    case noInternet

    var customDescription: String {
        switch self {
        case let .requestFailed(description): return "Request Failed: \(description)"
        case .invalidData: return "Invalid Data)"
        case let .responseUnsuccessful(description): return "Unsuccessful: \(description)"
        case let .jsonConversionFailure(description): return "JSON Conversion Failure: \(description)"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .failedSerialization: return "Serialization failed."
        case .noInternet: return "No internet connection"
        }
    }
}

protocol GenericApi {
    var session: URLSession { get }
    func fetch<T: Codable>(type: T.Type,
                           withRequest request: URLRequest,
                           withDecoder decoder: JSONDecoder) async throws -> T
}

extension GenericApi {
    func fetch<T: Codable>(type: T.Type,
                           withRequest request: URLRequest,
                           withDecoder decoder: JSONDecoder = JSONDecoder()) async throws -> T {
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.requestFailed(description: "Invalid response")
        }
        guard httpResponse.statusCode == 200 else {
            throw ApiError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
        }

        do {
            return try decoder.decode(type, from: data)
        } catch {
            throw ApiError.jsonConversionFailure(description: error.localizedDescription)
        }
    }
}
