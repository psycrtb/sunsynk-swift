//
//  PlantsDTO.swift
//  SunsynkSwift
//
//  Created by Tim B on 19/08/2025.
//

import Foundation

public struct PlantsDTO: Codable {
    let code: Int
    let msg: String
    let success: Bool
    let data: PlantsDataDTO?
}

public struct PlantsDataDTO: Codable {
    let pageSize: Int?
    let pageNumber: Int?
    let total: Int?
    let infos: [PlantDataDTO] = []
}

public struct PlantDataDTO: Codable {
    let id: Int?
    let name: String?
    let thumbUrl: String?
    let status: Int?
    let address: String?
    let pac: Int?
    let efficiency: Float?
    let etoday: Float?
    let etotal: Float?
    let updateAt: Date?
//    let createAt: Date
    let type: Int?
    let masterId: Int?
    // No more else has been added.
}
