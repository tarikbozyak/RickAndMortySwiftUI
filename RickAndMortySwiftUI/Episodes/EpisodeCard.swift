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
            ZStack {
                LinearGradient(colors: [Color("season\(seasonNumber)"),Color(.systemGray5), Color("season\(seasonNumber)")],
                               startPoint: .topLeading,
                               endPoint: .center)
                VStack{
                    Text("\(episodeNumber)")
                        .font(Font.custom("Avenir Next Condensed Bold", size: geo.size.height / 3.5))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                    
                    Text(episodeName)
                        .font(Font.custom("Avenir Next Condensed Bold", size: geo.size.height / 10))
                        .foregroundColor(.white)
                        .lineLimit(3)
                        .padding(.horizontal)
                    
                    
                    Spacer()
                }
            }
            
            
            
        }
    }
}

struct EpisodeCard_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCard(with: dev.episode)
    }
}
