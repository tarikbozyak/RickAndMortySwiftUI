//
//  CharacterCard.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 6.11.2022.
//

import SwiftUI

struct CharacterCard: View {
    var body: some View {
        ZStack{
            CharacterImage
            VStack{
                Spacer()
                ZStack{
                    LinearGradient(colors: [.black, .clear], startPoint: .center, endPoint: .top)
                        .opacity(0.65)
                    CharacterDescription
                    
                }
                .aspectRatio(10/3.5, contentMode: .fit)
            }
        }
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

extension CharacterCard{
    private var CharacterImage: some View {
        Image("character5")
            .resizable()
            .cornerRadius(10)
        
    }
    
    private var CharacterDescription: some View {
        VStack(spacing: 0){
            HStack{
                Text("Rick Morty")
                    .foregroundColor(.white)
                    .font(.headline)
                
                Spacer()
                
                HStack{
                    Circle().frame(width: 10, height: 10)
                        .foregroundColor(.green)
                        .padding(.leading,7)
                    Text("Alive")
                        .foregroundColor(.white)
                        .font(.caption2)
                        .padding(.trailing, 5)
                }
                .background(.blue)
                .cornerRadius(10)
            }
            .padding(.top, 15)
            HStack{
                Text("Human")
                    .foregroundColor(.white)
                    .font(.caption2)
                Spacer()
            }
            Spacer()
            
        }
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
    }
}

struct CharacterCard_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCard()
            .frame(width: 250, height: 250)
    }
}
