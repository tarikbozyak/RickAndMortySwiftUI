//
//  BottomSheet.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 27.12.2022.
//

import SwiftUI


struct BottomSheet: View {
    @Binding var selectedStatus: Status
    @Namespace var animation
    @State var gridLayout: [GridItem] = [ GridItem() ]
    
    private var columns: [GridItem] {
            return [
                .init(.adaptive(minimum: 100, maximum: 150))
            ]
        }
    
    var body: some View {

        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Spacer()
                    .frame(height: 24)
                
                Text("Status")
                    .font(.title)
                    .fontWeight(.bold)
                
                LazyVGrid(columns: columns, alignment: .leading) {
                    FilterStatusButton(button: .All, livingStatus: $selectedStatus, animation: animation)
                    FilterStatusButton(button: .Alive, livingStatus: $selectedStatus, animation: animation)
                    FilterStatusButton(button: .Dead, livingStatus: $selectedStatus, animation: animation)
                    FilterStatusButton(button: .Unknown, livingStatus: $selectedStatus, animation: animation)
                }
                
                Spacer()
            }
            .padding(16)
        }
        
        
    }
}
