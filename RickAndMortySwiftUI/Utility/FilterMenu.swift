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
    
    @Binding var gender: Gender
    @State var selectedGender: Gender
    
    @Binding var species: Species
    @State var selectedSpecies: Species
    
    init(status: Binding<Status>, gender: Binding<Gender>, species: Binding<Species>) {
        _status = Binding(projectedValue: status)
        _selectedStatus = State(wrappedValue: status.wrappedValue)
        _gender = Binding(projectedValue: gender)
        _selectedGender = State(wrappedValue: gender.wrappedValue)
        _species = Binding(projectedValue: species)
        _selectedSpecies = State(wrappedValue: species.wrappedValue)
    }
    
    var isFiltering: Bool {
        return status != .All || gender != .All || species != .All
    }
    
    var body: some View {
        List {
            Picker("Status", selection: $selectedStatus) {
                Text("All").tag(Status.All)
                Text("Alive").tag(Status.Alive)
                Text("Dead").tag(Status.Dead)
                Text("Unknown").tag(Status.Unknown)
            }
            
            Picker("Gender", selection: $selectedGender) {
                Text("All").tag(Gender.All)
                Text("Male").tag(Gender.Male)
                Text("Female").tag(Gender.Female)
                Text("Genderless").tag(Gender.Genderless)
                Text("Unknown").tag(Gender.Unknown)
            }
            
            Picker("Species", selection: $selectedSpecies) {
                Text("All").tag(Species.All)
                Text("Human").tag(Species.Human)
                Text("Alien").tag(Species.Alien)
                Text("Unknown").tag(Species.Unknown)
                Text("Other").tag(Species.Other)
            }
            
            Button {
                status = selectedStatus
                gender = selectedGender
                species = selectedSpecies
            } label: {
                Text("Apply Changes")
            }
            
            if isFiltering {
                Button(role: .destructive) {
                    selectedStatus = .All
                    selectedGender = .All
                    selectedSpecies = .All
                    status = selectedStatus
                    gender = selectedGender
                    species = selectedSpecies
                } label: {
                    Text("Clear Changes")
                }
            }
        }
    }
}
