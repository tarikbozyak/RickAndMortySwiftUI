//
//  EpisodeCard.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 15.11.2022.
//

import SwiftUI

struct EpisodeCard: View {
    
    var episode: EpisodeModel
    var episodeNumber: Int
    var seasonNumber: Int
    var episodeName: String
    var airDate: String
    
    init(with item: EpisodeModel){
        self.episode = item
        self.episodeNumber = (item.episode ?? "").getEpisodeInfo().1
        self.seasonNumber = (item.episode ?? "").getEpisodeInfo().0
        self.episodeName = item.name ?? ""
        self.airDate = item.airDate ?? ""
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack (alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(geo.size.width/15)
                    .overlay {
                        Text("\(episodeNumber)")
                            .font(Font.custom("1", size: geo.size.height / 2.4))
                            .foregroundColor(.white)
                    }
                Text(episodeName)
                    .lineLimit(1)
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
