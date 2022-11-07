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
            Color.gray
            VStack{
                Image("character5").resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .shadow(radius: 10)
                Text("Hello")
                Spacer()
            }
        }
    }
}

struct CharacterCard_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCard()
            .frame(width: 200, height: 250)
    }
}
