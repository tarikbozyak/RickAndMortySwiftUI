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
                    List {
                        ForEach(vm.resultList) { item in
                            Text(item.name ?? "")
                                .onAppear(perform: {
                                    if vm.hasReachedEnd(of: item) && !vm.isFetching {
                                        Task {
                                            try? await vm.fetchNextSetOfLocations()
                                        }
                                    }
                                })
                        }
                    }
                    .listStyle(.insetGrouped)
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
