//
//  WelcomeResponse.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    
    let info: Info?
    let results: [ResultModel]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct ResultModel: Codable, Hashable {
    let id: Int?
    let name: String?
    let status: Status?
    let species: String?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable, Hashable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable, Hashable {
    let name: String?
    let url: String?
}

enum Status: String, Codable, Hashable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}



