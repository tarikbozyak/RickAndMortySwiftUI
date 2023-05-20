//
//  Episodes.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 9.11.2022.
//

import SwiftUI

struct Episodes: View {
    @State private var hasAppeared: Bool = false
    @StateObject private var vm = EpisodesViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical ,showsIndicators: false) {
                    ForEach(Array(vm.result.enumerated()), id: \.offset) { index, item in
                        EpisodeWidget(episodeList: item, seasonNumber: index + 1)
                    }
                    .padding(.top,10)
                }
                Spacer()
            }
            .navigationTitle("Episode")
            .navigationBarTitleDisplayMode(.large)
        }.task {
            if !hasAppeared{
                try? await vm.getDatas()
                hasAppeared = true
            }
        }
        
    }
}

struct Episodes_Previews: PreviewProvider {
    static var previews: some View {
        Episodes()
    }
}
