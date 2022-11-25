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
                ScrollView(.horizontal ,showsIndicators: false) {
                    HStack(alignment: .top, spacing: 20) {
                        Spacer(minLength: 0)
                            ForEach(vm.resultList, id: \.self) { item in
                                EpisodeCard(with: item)
                                    .shadow(radius: 5)
                                    .frame(width:150, height: 250)
                            }
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
