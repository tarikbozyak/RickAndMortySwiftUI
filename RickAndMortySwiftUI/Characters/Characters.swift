//
//  Characters.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import SwiftUI

struct Characters: View {
    @StateObject var vm = CharactersViewModel()
    var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 180), spacing: nil, alignment: nil),
        GridItem(.adaptive(minimum: 150, maximum: 180), spacing: nil, alignment: nil)]
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns) {
                CharacterCard(imageUrl: "", name: "Rick Morty")
                    .clipped()
                    .aspectRatio(1, contentMode: .fit)
                CharacterCard(imageUrl: "", name: "Martin Luten")
                    .clipped()
                    .aspectRatio(1, contentMode: .fit)
            }
            .task {
                try? await vm.getDatas()
            }
        }
        
        
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        Characters()
    }
}
