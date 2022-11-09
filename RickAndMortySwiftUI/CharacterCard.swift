//
//  CharacterCard.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 6.11.2022.
//

import SwiftUI
import Kingfisher

struct CharacterCard: View {
    
    var character: ResultModel
    var imageUrl: URL?
    var name: String
    var species: String
    var status: String
    var statusColor: Color
    
    init(character: ResultModel){
        imageUrl = URL(string: character.image ?? "")
        self.character = character
        self.name = character.name ?? ""
        self.species = character.species?.rawValue ?? ""
        self.status = character.status?.rawValue ?? ""
        self.statusColor = status == "Alive" ? .green : .red
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
        KFImage(imageUrl)
            .placeholder {
                Image(systemName: "arrow.2.circlepath.circle")
                    .font(.largeTitle)
                    .opacity(0.3)
            }
            .resizable()
        
    }
    
    private var CharacterDescription: some View {
        VStack(spacing: 0){
            HStack{
                Text(name)
                    .foregroundColor(.white)
                    .font(.headline)
                
                Spacer()
                
                HStack{
                    Text(status)
                        .foregroundColor(.white)
                        .font(.caption2)
                    if status.lowercased() != "unknown"{
                        Circle().frame(width: 12, height: 12)
                            .foregroundColor(statusColor)
                    }
                    
                    
                }
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                .background(.blue)
                .cornerRadius(10)
            }
            .padding(.top, 15)
            HStack{
                Text(species)
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
        CharacterCard(character: dev.result)
            .frame(width: 250, height: 250)
    }
}
