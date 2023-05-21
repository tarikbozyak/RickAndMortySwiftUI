//
//  LocationsResponse.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 16.04.2023.
//

import Foundation

// MARK: - Welcome
struct LocationResponse: Codable {
    let info: Info?
    let results: [LocationModel]?
}

// MARK: - Result
struct LocationModel: Codable, Hashable, Identifiable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}

