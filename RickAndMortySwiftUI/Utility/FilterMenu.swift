//
//  FilterMenu.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 20.05.2023.
//

import SwiftUI

struct FilterMenu: View {
    
    @Binding var status: Status
    @State var selectedStatus: Status
    
    init(status: Binding<Status>) {
        _status = Binding(projectedValue: status)
        _selectedStatus = State(wrappedValue: status.wrappedValue)
    }
    
    var body: some View {
        List {
            Picker("Status", selection: $selectedStatus) {
                Text("All").tag(Status.All)
                Text("Alive").tag(Status.Alive)
                Text("Dead").tag(Status.Dead)
                Text("Unknown").tag(Status.Unknown)
            }
            
            Button {
                status = selectedStatus
            } label: {
                Text("Apply Changes")
            }
        }
    }
}
