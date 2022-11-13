//
//  Characters.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import SwiftUI

struct Characters: View {
    @State private var searchText = ""
    @State private var hasAppeared: Bool = false
    @StateObject private var vm = CharactersViewModel()
    
    var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 180), spacing: 20, alignment: nil),
        GridItem(.adaptive(minimum: 150, maximum: 180), spacing: 20, alignment: nil)]
    var body: some View {
        NavigationView{
            ZStack{
                if vm.isLoading {
                    ProgressView()
                }
                else {
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
                                        .task {
                                            if vm.hasReachedEnd(of: item) && !vm.isFetching {
                                                try? await vm.fetchNextSetOfUsers()
                                            }
                                        }
                                }
                            }
                            
                        }
                    }
                    .overlay(alignment: .bottom) {
                        if vm.isFetching {
                            ProgressView()
                        }
                    }
                }
            }
            
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Look for something")
            .navigationTitle("Characters")
            .navigationBarTitleDisplayMode(.large)
        }
        .task {
            if !hasAppeared {
                
                try? await vm.getDatas()
                hasAppeared = true
            }
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        Characters()
    }
}
