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
    let results: [Character]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Character: Codable, Hashable {
    let id: Int?
    let name: String?
    let status: Status?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Species
enum Species: String, Codable, Hashable {
    case All
    case Human = "Human"
    case Alien = "Alien"
    case Unknown = "unknown"
    case Other = "Other"
    
    init?(rawValue: String) {
        switch rawValue {
        case "Human": self = .Human
        case "Alien": self = .Alien
        case "Unknown": self = .Unknown
        default : self = .Other
        }
    }
}

// MARK: - Gender
enum Gender: String, Codable, Hashable {
    case All
    case Female = "Female"
    case Male = "Male"
    case Genderless = "Genderless"
    case Unknown = "unknown"
}

// MARK: - Location
struct Location: Codable, Hashable {
    let name: String?
    let url: String?
}

// MARK: - Status
enum Status: String, Codable, Hashable {
    case All
    case Alive = "Alive"
    case Dead = "Dead"
    case Unknown = "unknown"
}



