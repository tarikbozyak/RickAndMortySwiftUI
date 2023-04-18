//
//  Locations.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 9.11.2022.
//

import SwiftUI

struct Locations: View {
    
    @State private var hasAppeared: Bool = false
    @StateObject private var vm = LocationsViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                if vm.isLoading {
                    ProgressView()
                }
                else {
                    ScrollView {
                        LazyVStack(spacing: 10) {
                            
                            ForEach(vm.resultList, id: \.self){item in
                                Text(item.name ?? "NO-NAME")
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
            
            .navigationTitle("Locations")
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

struct Locations_Previews: PreviewProvider {
    static var previews: some View {
        Locations()
    }
}
