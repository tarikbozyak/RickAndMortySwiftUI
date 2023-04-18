//
//  FilterButton.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 27.12.2022.
//

import SwiftUI

struct FilterStatusButton: View {
    var button: Status
    @Binding var livingStatus: Status
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){
                livingStatus = button
            }
        }) {
            HStack(spacing: 4){
                if button == .Alive || button == .Dead {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(button == .Alive ? .green : .red)
                }
                
                Text(button.rawValue)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .lineLimit(1)
            }
            .padding()
            .overlay {
                if livingStatus == button {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 3)
                }
            }
            
        }
    }
}
