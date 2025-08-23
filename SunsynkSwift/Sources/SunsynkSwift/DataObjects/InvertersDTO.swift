//
//  InvertersDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 22/08/2025.
//

import Foundation

public struct InvertersDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: InvertersDataDTO?
}

public struct InvertersDataDTO: Codable {
    let pageSize: Int?
    let pageNumber: Int?
    let total: Int?
    let infos: [InverterDataDTO] = []
}

public struct InverterDataDTO: Codable {
    let id: Int?
    let sn: String?
    let alias: String?
    let gsn: String?
    let status: Int?
    let type: Int?
    let commTypeName: String?
    let custCode: Int?
    let pac: Int?
    let opened: Int?
    let sunsynkEquip: Bool?
    let protocolIdentifier: String?
    let equipType: Int?
    let version: VersionDTO?
    let etoday: Float?
    let etotal: Float?
    let updateAt: String? // Date later?
    let plant: InverterPlantDataDTO?
}

public struct VersionDTO: Codable {
    let masterVer: String?
    let softVer: String?
    let hardVer: String?
    let hmiVer: String?
    let bmsVer: String?
}

public struct InverterPlantDataDTO: Codable {
    let id: Int?
    let name: String?
    let type: Int?
}
