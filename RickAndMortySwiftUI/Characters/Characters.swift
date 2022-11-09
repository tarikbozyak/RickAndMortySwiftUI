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
        GridItem(.adaptive(minimum: 150, maximum: 180), spacing: 20, alignment: nil),
        GridItem(.adaptive(minimum: 150, maximum: 180), spacing: 20, alignment: nil)]
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    Spacer(minLength: 10)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(vm.resultList, id: \.self) { item in
                            CharacterCard(character: item)
                                .clipped()
                                .aspectRatio(1, contentMode: .fit)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                        }
                    }
                    .task {
                        try? await vm.getDatas()
                    }
                }
            }
            .navigationTitle("Characters")
            .navigationBarTitleDisplayMode(.large)
        }
        
        
        
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        Characters()
    }
}
