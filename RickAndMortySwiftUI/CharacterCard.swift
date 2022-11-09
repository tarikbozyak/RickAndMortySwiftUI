//
//  CharacterCard.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 6.11.2022.
//

import SwiftUI

struct CharacterCard: View {
    
    var character: ResultModel
    
    init(character: ResultModel){
        self.character = character
    }
    
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
                Text(character.name ?? "")
                    .foregroundColor(.white)
                    .font(.headline)
                
                Spacer()
                
                HStack{
                    Text("Alive")
                        .foregroundColor(.white)
                        .font(.caption2)
                    Circle().frame(width: 12, height: 12)
                        .foregroundColor(.green)
                    
                }
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
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
        CharacterCard(imageUrl: "", name: "String")
            .frame(width: 250, height: 250)
    }
}
