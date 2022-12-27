//
//  FilterButton.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 27.12.2022.
//

import SwiftUI

struct FilterButton: View {
    var buttonTitle: String
    @Binding var livingStatus: LivingStatus
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){
                livingStatus = LivingStatus(rawValue: buttonTitle)!
            }
        }) {
            HStack{
                if buttonTitle == LivingStatus.Live.rawValue || buttonTitle == LivingStatus.Dead.rawValue{
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundColor(buttonTitle == LivingStatus.Live.rawValue ? .green : .red)
                }
                
                Text(buttonTitle)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
            }
            .padding()
            .overlay {
                if livingStatus == LivingStatus(rawValue: buttonTitle){
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                }
            }
            
        }
    }
}
