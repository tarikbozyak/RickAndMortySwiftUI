//
//  EpisodeResponse.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 15.11.2022.
//

import Foundation

// MARK: - EpisodeResponse
struct EpisodeResponse: Codable {
    
    let info: Info?
    let results: [EpisodeModel]?
}

// MARK: - EpisodeModel
struct EpisodeModel: Codable, Hashable {
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let url: String?
    let created: String?
    let characters: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}




