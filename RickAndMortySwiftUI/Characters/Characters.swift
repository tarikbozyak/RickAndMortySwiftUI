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
        GridItem(.adaptive(minimum: 150, maximum: 250), spacing: nil, alignment: nil),
        GridItem(.adaptive(minimum: 150, maximum: 250), spacing: nil, alignment: nil)]
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns) {
                CharacterCard()
                    .frame(height: 200)
                Rectangle()
                    .frame(height: 250)
                Rectangle()
                    .frame(height: 250)
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
