//
//  InvertersDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 22/08/2025.
//

import Foundation

public struct InvertersDTO: Codable {
    public let code: Int
    public let msg: String
    public let success: Bool
    public let data: InvertersDataDTO?
}

public struct InvertersDataDTO: Codable {
    public let pageSize: Int?
    public let pageNumber: Int?
    public let total: Int?
    public let infos: [InverterDataDTO] = []
}

public struct InverterDataDTO: Codable {
    public let id: Int?
    public let sn: String?
    public let alias: String?
    public let gsn: String?
    public let status: Int?
    public let type: Int?
    public let commTypeName: String?
    public let custCode: Int?
    public let pac: Int?
    public let opened: Int?
    public let sunsynkEquip: Bool?
    public let protocolIdentifier: String?
    public let equipType: Int?
    public let version: VersionDTO?
    public let etoday: Float?
    public let etotal: Float?
    public let updateAt: String? // Date later?
    public let plant: InverterPlantDataDTO?
}

public struct VersionDTO: Codable {
    public let masterVer: String?
    public let softVer: String?
    public let hardVer: String?
    public let hmiVer: String?
    public let bmsVer: String?
}

public struct InverterPlantDataDTO: Codable {
    public let id: Int?
    public let name: String?
    public let type: Int?
}
