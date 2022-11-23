//
//  PreviewProvider.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 9.11.2022.
//

import Foundation
import SwiftUI

extension PreviewProvider{
    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview{
    static let instance = DeveloperPreview()
    
    let result = ResultModel(id: 1, name: "Rick Sanchez", status: .alive, species: "Human", type: nil, gender: .male, origin: nil, location: nil, image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: nil, url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z")
    
    let episode = EpisodeModel(id: 1, name: "Pilot", airDate: "December 2, 2013", episode: "S03E12", url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z", characters: ["https://rickandmortyapi.com/api/character/1", "https://rickandmortyapi.com/api/character/2"])
  }
