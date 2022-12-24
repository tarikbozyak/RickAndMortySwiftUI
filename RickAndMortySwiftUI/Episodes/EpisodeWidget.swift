//
//  EpisodeWidget.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 5.12.2022.
//

import SwiftUI

struct EpisodeWidget: View {
    
    @State var episodeList: [EpisodeModel]
    var seasonNumber: Int
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(seasonNumber). Season")
                .padding()
            Spacer(minLength: 20)
            ScrollView(.horizontal ,showsIndicators: false) {
                LazyHStack(alignment: .top, spacing:20) {
                    ForEach(episodeList, id: \.self){ item in
                        EpisodeCard(with: item)
                            .shadow(radius: 5)
                            .frame(width:150, height: 250)
                    }
                }
                .padding()
            }
            
        }
    }
}

struct EpisodeWidget_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeWidget(episodeList: [], seasonNumber: 1)
    }
}
