//
//  FlowDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 20/08/2025.
//

import Foundation

public struct FlowDTO: Codable {
    public let code: Int
    public let msg: String
    public let success: Bool
    public let data: FlowDataDTO?
}

public struct FlowDataDTO: Codable {
    public let custCode: Int?
    public let protocolIdentifier: String?
    public let meterCode: Int?
    public let pvPower: Float?
    public let battPower: Float?
    public let battPower2: Float?
    public let gridOrMeterPower: Float?
    public let loadOrEpsPower: Float?
    public let genPower: Float?
    public let minPower: Float?
    public let soc: Float?
    public let smartLoadPower: Float?
    public let upsLoadPower: Float?
    public let homeLoadPower: Float?
    public let chargePilePower: Float?
    public let pvTo: Bool?
    public let toLoad: Bool?
    public let toSmartLoad: Bool?
    public let toUpsLoad: Bool?
    public let toHomeLoad: Bool?
    public let toGrid: Bool?
    public let toBat: Bool?
    public let gridTo: Bool?
    public let genTo: Bool?
    public let minTo: Bool?
    public let toChargePile: Bool?
    public let existsGen: Bool?
    public let existsMin: Bool?
    public let existsGrid: Bool?
    public let genOn: Bool?
    public let microOn: Bool?
    public let existsMeter: Bool?
    public let bmsCommFaultFlag: Bool?
    public let existsThreeLoad: Bool?
    public let existsSmartLoad: Bool?
    public let existsChargePile: Bool?
    public let pv: Int?
    public let existThinkPower: Bool?
    public let time: String?
}
