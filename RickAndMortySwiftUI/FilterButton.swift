//
//  FilterButton.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 27.12.2022.
//

import SwiftUI

struct FilterButton: View {
    var button: LivingStatus
    @Binding var livingStatus: LivingStatus
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){
                livingStatus = button
            }
        }) {
            HStack{
                if button == .Live || button == .Dead {
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundColor(button == .Live ? .green : .red)
                }
                
                Text(button.rawValue)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
            }
            .padding()
            .overlay {
                if livingStatus == button {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                }
            }
            
        }
    }
}
