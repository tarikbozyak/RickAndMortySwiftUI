//
//  BottomSheet.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 27.12.2022.
//

import SwiftUI

enum LivingStatus: String{
    case All
    case Alive
    case Dead
    case Unknown
}

struct BottomSheet: View {
    @Binding var selectedStatus: LivingStatus
    @Namespace var animation
    var body: some View {

        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Spacer()
                    .frame(height: 24)
                
                Text("Status")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 16) {
                    FilterButton(button: .All, livingStatus: $selectedStatus, animation: animation)
                    FilterButton(button: .Alive, livingStatus: $selectedStatus, animation: animation)
                    FilterButton(button: .Dead, livingStatus: $selectedStatus, animation: animation)
                    FilterButton(button: .Unknown, livingStatus: $selectedStatus, animation: animation)
                }
                
                Text("Gender")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 16) {
                    FilterButton(button: .All, livingStatus: $selectedStatus, animation: animation)
                    FilterButton(button: .Alive, livingStatus: $selectedStatus, animation: animation)
                    FilterButton(button: .Dead, livingStatus: $selectedStatus, animation: animation)
                    FilterButton(button: .Unknown, livingStatus: $selectedStatus, animation: animation)
                }
                
                
                
                Spacer()
            }
            .padding(8)
        }
        
        
    }
}
