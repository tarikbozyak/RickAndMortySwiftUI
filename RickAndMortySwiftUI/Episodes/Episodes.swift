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
    
    var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 180), spacing: 20, alignment: nil),
        GridItem(.adaptive(minimum: 150, maximum: 180), spacing: 20, alignment: nil)]
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView {
                    VStack {
                        Spacer(minLength: 10)
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(vm.resultList, id: \.self) { item in
                                EpisodeCard(with: item)
                                    .clipped()
                                    .shadow(radius: 10)
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        
                    }
                }
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
