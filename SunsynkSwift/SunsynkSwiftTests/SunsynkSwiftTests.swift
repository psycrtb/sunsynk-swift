//
//  SunsynkSwiftTests.swift
//  SunsynkSwiftTests
//
//  Created by Tim B on 14/08/2025.
//

import Testing
@testable import SunsynkSwift

struct SunsynkSwiftTests {
    let username = "test"
    let password = "test"
    let plantId = 123

    @Test func tokenRequest() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.

        do {
            let test = try await Sunsynk().token(username: username, password: password)
            print("test \(test)")
        } catch {
            print("Failed!")
        }
    }

    @Test func realtimeRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token

            let realtime = try await Sunsynk().realtime(token: accessToken, plantId: plantId)
            print("realtime \(realtime)")
        } catch {
            print("Failed!")
        }
    }

    @Test func plantsRequest() async throws {
        do {
            let token = try await Sunsynk().token(username: username, password: password)
            let accessToken = token.data.access_token

            let plants = try await Sunsynk().plants(token: accessToken)
            print("plants \(plants)")
        } catch {
            print("Failed!")
        }
    }
}
