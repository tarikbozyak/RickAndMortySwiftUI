//
//  EpisodeWidget.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 5.12.2022.
//

import SwiftUI

struct EpisodeWidget: View {
    
    @State var episodeList: [EpisodeModel]
    @State var isCollapsed: Bool = false
    
    
    var seasonNumber: Int
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("\(seasonNumber). Season")
                    .fontWeight(.heavy)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    withAnimation(.spring()){
                        isCollapsed.toggle()
                    }
                }) {
                    if isCollapsed{
                        Text("Hide")
                    } else {
                        Text("Show All")
                    }
                }
                .padding(.horizontal)
            }
            
            Rectangle()
                .fill(Color.black)
                .frame(height: 2)
            
            Spacer(minLength: 20)
            
            
            if isCollapsed {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                    ForEach(episodeList) { item in
                        EpisodeCard(with: item)
                            .shadow(radius: 3)
                            .cornerRadius(15)
                            .frame(width:120, height: 200)
                    }
                }
                .padding(.horizontal)
            } else {
                ScrollView(.horizontal ,showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing:15) {
                        ForEach(episodeList, id: \.self){ item in
                            EpisodeCard(with: item)
                                .shadow(radius: 3)
                                .cornerRadius(15)
                                .frame(width:120, height: 200)
                            
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            Spacer(minLength: 20)
            
        }
    }
}

struct EpisodeWidget_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeWidget(episodeList: [], seasonNumber: 1)
    }
}
