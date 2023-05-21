//
//  MainTabView.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 9.11.2022.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            Characters()
                .tabItem {
                    Label("Characters", systemImage: "person.3.sequence.fill")
                }

            Episodes()
                .tabItem {
                    Label("Episodes", systemImage: "puzzlepiece.fill")
                }
            
            Locations()
                .tabItem {
                    Label("Locations", systemImage: "map")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
