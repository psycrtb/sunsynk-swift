//
//  SunsynkSwiftTests.swift
//  SunsynkSwiftTests
//
//  Created by Tim B on 14/08/2025.
//

import Testing
import Foundation
@testable import SunsynkSwift

struct SunsynkSwiftTests {
    let username = "test"
    let password = "test"
    let plantId = 123

    @Test func tokenRequest() async throws {
        do {
            let test = try await Sunsynk().token(username: username, password: password)
            print("test \(test)")
            #expect(Bool(true))
        } catch {
            print("Failed! \(error)")
            #expect(Bool(false))
        }
    }

    @Test func realtimeRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token

            let realtime = try await Sunsynk().realtime(token: accessToken, plantId: plantId)
            print("realtime \(realtime)")
            #expect(Bool(true))
        } catch {
            print("Failed! \(error)")
            #expect(Bool(false))
        }
    }

    @Test func plantsRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token

            let plants = try await Sunsynk().plants(token: accessToken)
            print("plants \(plants)")
            #expect(Bool(true))
        } catch {
            print("Failed! \(error)")
            #expect(Bool(false))
        }
    }

    @Test func userRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token

            let user = try await Sunsynk().user(token: accessToken, language: "en")
            print("user \(user)")
            #expect(Bool(true))
        } catch {
            print("Failed! \(error)")
            #expect(Bool(false))
        }
    }

    @Test func flowRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token

            let flow = try await Sunsynk().flow(token: accessToken, plantId: plantId, date: Date())
            print("flow \(flow)")
            #expect(Bool(true))
        } catch {
            print("Failed! \(error)")
            #expect(Bool(false))
        }
    }

    @Test func useRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token

            let use = try await Sunsynk().use(token: accessToken, plantId: plantId)
            print("use \(use)")
            #expect(Bool(true))
        } catch {
            print("Failed! \(error)")
            #expect(Bool(false))
        }
    }

    @Test func dayRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token
            let day = try await Sunsynk().day(token: accessToken, language: "en", plantId: plantId, date: Date())
            print("day \(day)")
            #expect(Bool(true))
        } catch {
            print("Failed! \(error)")
            #expect(Bool(false))
        }
    }

    @Test func monthRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token
            let month = try await Sunsynk().month(token: accessToken, language: "en", plantId: plantId, date: Date())
            print("month \(month)")
            #expect(Bool(true))
        } catch {
            print("Failed! \(error)")
            #expect(Bool(false))
        }
    }

    @Test func yearRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token
            let year = try await Sunsynk().year(token: accessToken, language: "en", plantId: plantId, date: Date())
            print("year \(year)")
            #expect(Bool(true))
        } catch {
            print("Failed! \(error)")
            #expect(Bool(false))
        }
    }

    @Test func totalRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token
            let total = try await Sunsynk().total(token: accessToken, language: "en", plantId: plantId, date: Date())
            print("total \(total)")
            #expect(Bool(true))
        } catch {
            print("Failed! \(error)")
            #expect(Bool(false))
        }
    }

    @Test func invertersRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token
            let inverters = try await Sunsynk().inverters(token: accessToken, plantId: plantId)
            print("inverters \(inverters)")
            #expect(Bool(true))
        } catch {
            print("Failed! \(error)")
            #expect(Bool(false))
        }
    }
}
