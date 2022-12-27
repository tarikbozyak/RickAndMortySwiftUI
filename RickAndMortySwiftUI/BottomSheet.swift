//
//  BottomSheet.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 27.12.2022.
//

import SwiftUI

enum LivingStatus: String{
    case All
    case Live
    case Dead
}

struct BottomSheet: View {
    @Binding var selectedButton: LivingStatus
    @Namespace var animation
    var body: some View {
        
        VStack {
            HStack(spacing: 24) {
                
                FilterButton(button: .All, livingStatus: $selectedButton, animation: animation)
                FilterButton(button: .Live, livingStatus: $selectedButton, animation: animation)
                FilterButton(button: .Dead, livingStatus: $selectedButton, animation: animation)
                
            }
        }
        
        
    }
}
