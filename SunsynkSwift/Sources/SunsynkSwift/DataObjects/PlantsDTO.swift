//
//  PlantsDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 19/08/2025.
//

import Foundation

public struct PlantsDTO: Codable {
    public let code: Int
    public let msg: String
    public let success: Bool
    public let data: PlantsDataDTO?
}

public struct PlantsDataDTO: Codable {
    public let pageSize: Int?
    public let pageNumber: Int?
    public let total: Int?
    public let infos: [PlantDataDTO]
}

public struct PlantDataDTO: Codable {
    public let id: Int?
    public let name: String?
    public let thumbUrl: String?
    public let status: Int?
    public let address: String?
    public let pac: Int?
    public let efficiency: Float?
    public let etoday: Float?
    public let etotal: Float?
    public let updateAt: Date?
//    public let createAt: Date
    public let type: Int?
    public let masterId: Int?
    // No more else has been added.

    public init(id: Int?, name: String?, thumbUrl: String?, status: Int?, address: String?, pac: Int?, efficiency: Float?, etoday: Float?, etotal: Float?, updateAt: Date?, type: Int?, masterId: Int?) {
        self.id = id
        self.name = name
        self.thumbUrl = thumbUrl
        self.status = status
        self.address = address
        self.pac = pac
        self.efficiency = efficiency
        self.etoday = etoday
        self.etotal = etotal
        self.updateAt = updateAt
        self.type = type
        self.masterId = masterId
    }
}
