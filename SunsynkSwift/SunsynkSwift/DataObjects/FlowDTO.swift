//
//  FlowDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 20/08/2025.
//

import Foundation

struct FlowDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: FlowDataDTO
}

struct FlowDataDTO: Codable {
    let custCode: Int
    let protocolIdentifier: String
    let meterCode: Int
    let pvPower: Float
    let battPower: Float
    let battPower2: Float
    let gridOrMeterPower: Float
    let loadOrEpsPower: Float
    let genPower: Float
    let minPower: Float
    let soc: Float
    let smartLoadPower: Float
    let upsLoadPower: Float
    let homeLoadPower: Float
    let chargePilePower: Float
    let pvTo: Bool
    let toLoad: Bool
    let toSmartLoad: Bool
    let toUpsLoad: Bool
    let toHomeLoad: Bool
    let toGrid: Bool
    let toBat: Bool
    let gridTo: Bool
    let genTo: Bool
    let minTo: Bool
    let toChargePile: Bool
    let existsGen: Bool
    let existsMin: Bool
    let existsGrid: Bool
    let genOn: Bool
    let microOn: Bool
    let existsMeter: Bool
    let bmsCommFaultFlag: Bool
    let existsThreeLoad: Bool
    let existsSmartLoad: Bool
    let existsChargePile: Bool
    let pv: Int?
    let existThinkPower: Bool
    let time: String?
}
