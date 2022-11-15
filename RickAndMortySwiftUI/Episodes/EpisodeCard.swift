//
//  EpisodeCard.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 15.11.2022.
//

import SwiftUI

struct EpisodeCard: View {
    
    var episode: EpisodeModel
    var episodeKey: String?
    var episodeName: String
    var airDate: String
    
    init(with item: EpisodeModel){
        self.episode = item
        self.episodeKey = item.episode ?? ""
        self.episodeName = item.name ?? ""
        self.airDate = item.airDate ?? ""
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EpisodeCard_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCard(with: dev.episode)
    }
}
