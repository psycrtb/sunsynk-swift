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
    static let inverters = "/api/v1/plant/___/inverters"
}

protocol SunsynkApi: GenericApi {
    
    /// Gets an Auth token so you can make further calls to the API. Token is valid for a week
    /// - Parameters:
    ///   - client_id: Unsure what this is
    ///   - grant_type: Unsure what this is
    ///   - source: Unsure what this is
    ///   - username: User Email address
    ///   - password: User Password
    /// - Returns: Token response DTO which includes a token and refresh token
    func token(client_id: String,
               grant_type: String,
               source: String,
               username: String,
               password: String) async throws -> TokenResponseDTO
    
    /// Gets the data now for the specific plant
    /// - Parameters:
    ///   - token: Auth token
    ///   - plantId: The power plants' ID
    /// - Returns: Realtime breakdown of the power production
    func realtime(token: String,
                  plantId: Int) async throws -> RealtimeDTO
    
    /// Gets a list of power plants that may be needed for further calls
    /// - Parameters:
    ///   - token: Auth token
    ///   - page: Paginated list of plants
    ///   - limit: number of plants for each page to contain
    /// - Returns: List of power plants
    func plants(token: String,
                page: Int,
                limit: Int) async throws -> PlantsDTO

    /// Gets various information on the user
    /// - Parameters:
    ///   - token: Auth token
    ///   - language: 2 letter description of language. i.e. "en"
    /// - Returns: User information
    func user(token: String,
              language: String) async throws -> UserDTO
    
    /// Gets information on how the power is flowing within the system
    /// - Parameters:
    ///   - token: Auth token
    ///   - plantId: Power plant ID
    ///   - date: The date to reference
    /// - Returns: Flow information
    func flow(token: String,
              plantId: Int,
              date: Date) async throws -> FlowDTO
    
    /// Gets current use
    /// - Parameters:
    ///   - token: Auth token
    ///   - plantId: Power plant ID
    /// - Returns: Use information
    func use(token: String,
             plantId: Int) async throws -> UseDTO
    
    /// Gets use today per every few minutes
    /// - Parameters:
    ///   - token: Auth token
    ///   - language: 2 letter description of language. i.e. "en"
    ///   - plantId: Power plant ID
    ///   - date: The day to look up
    /// - Returns: Day use information
    func day(token: String,
             language: String,
             plantId: Int,
             date: Date) async throws -> DayDTO
    
    /// Gets use over the last month, with data on each day
    /// - Parameters:
    ///   - token: Auth token
    ///   - language: 2 letter description of language. i.e. "en"
    ///   - plantId: Power plant ID
    ///   - date: The month to look up
    /// - Returns: Month use information
    func month(token: String,
               language: String,
               plantId: Int,
               date: Date) async throws -> MonthDTO
    
    /// Gets use over the last year, with data on each month
    /// - Parameters:
    ///   - token: Auth token
    ///   - language: 2 letter description of language. i.e. "en"
    ///   - plantId: Power plant ID
    ///   - date: The year to look up
    /// - Returns: Year use information
    func year(token: String,
              language: String,
              plantId: Int,
              date: Date) async throws -> YearDTO
    
    /// Gets use over the lifetime of the installation
    /// - Parameters:
    ///   - token: Auth token
    ///   - language: 2 letter description of language. i.e. "en"
    ///   - plantId: Power plant ID
    ///   - date: Year to look up
    /// - Returns: Total use information
    func total(token: String,
               language: String,
               plantId: Int,
               date: Date) async throws -> TotalDTO
    
    /// Gets the inverter use now with more details on the setup
    /// - Parameters:
    ///   - token: Auth token
    ///   - plantId: Power plant ID
    ///   - page: Paginated list of plants
    ///   - limit: number of plants for each page to contain
    ///   - type: Unsure
    ///   - status: Unsure
    /// - Returns: Inverter information
    func inverters(token: String,
                   plantId: Int,
                   page: Int,
                   limit: Int,
                   type: Int,
                   status: Int) async throws -> InvertersDTO

    func request(path: String, queryItems: [String: String]) -> URLRequest?
}

extension SunsynkApi {
    func decoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
