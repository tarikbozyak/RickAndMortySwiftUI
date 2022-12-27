//
//  FilterButton.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 27.12.2022.
//

import SwiftUI

struct FilterButton: View {
    var title: String
    @Binding var livingStatus: LivingStatus
    var animation: Namespace.ID
    
    init(title: String, livingStatus: Binding<LivingStatus>, animation: Namespace.ID) {
        self.title = title
        _livingStatus = livingStatus
        self.animation = animation
    }
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){
                livingStatus = LivingStatus(rawValue: title)!
            }
        }) {
            HStack{
                if title == "Live" || title == "Dead"{
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundColor(title == "Live" ? .green : .red)
                }
                
                Text(title)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
            }
            .padding()
            .overlay {
                if livingStatus == LivingStatus(rawValue: title){
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                }
            }
            
        }
    }
}
