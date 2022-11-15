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
        GeometryReader { geo in
            VStack (alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                    .overlay {
                        Text("\(episode.id ?? 0)")
                            .font(Font.custom("1", size: geo.size.height / 2))
                            .foregroundColor(.white)
                    }
                Text("Pilot")
                    .padding()
            }
        }
    }
}

struct EpisodeCard_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCard(with: dev.episode)
    }
}
