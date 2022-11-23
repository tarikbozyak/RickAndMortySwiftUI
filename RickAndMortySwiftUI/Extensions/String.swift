//
//  String.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 22.11.2022.
//

import Foundation

extension String {
    func getEpisodeInfo() -> (Int,Int){
        guard self.contains("S") && self.contains("E") else {return (0,0)}
        let data = self.split(separator: "E")
        let seasonNumber = data.first?.replacingOccurrences(of: "S", with: "") ?? "0"
        let episodeNumber = String(data.last ?? "0")
        return (Int(seasonNumber) ?? 0,Int(episodeNumber) ?? 0)
    }
}
