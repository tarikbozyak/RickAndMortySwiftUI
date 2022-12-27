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
                
                FilterButton(buttonTitle: LivingStatus.All.rawValue, livingStatus: $selectedButton, animation: animation)
                FilterButton(buttonTitle: LivingStatus.Live.rawValue, livingStatus: $selectedButton, animation: animation)
                FilterButton(buttonTitle: LivingStatus.Dead.rawValue, livingStatus: $selectedButton, animation: animation)
                
            }
        }
        
        
    }
}
