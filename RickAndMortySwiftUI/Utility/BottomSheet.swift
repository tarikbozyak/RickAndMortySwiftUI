//
//  BottomSheet.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 27.12.2022.
//

import SwiftUI


struct BottomSheet: View {
    @Binding var selectedStatus: Status
    @Binding var selectedGender: Gender
    @Namespace var animation
    @State var gridLayout: [GridItem] = [ GridItem() ]
    
    private var columns: [GridItem] {
            return [
                .init(.adaptive(minimum: 80, maximum: 120))
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
                
                Text("Gender")
                    .font(.title)
                    .fontWeight(.bold)
                
                LazyVGrid(columns: columns, alignment: .leading) {
                    FilterGenderButton(button: .All, genderStatus: $selectedGender, animation: animation)
                    FilterGenderButton(button: .Male, genderStatus: $selectedGender, animation: animation)
                    FilterGenderButton(button: .Female, genderStatus: $selectedGender, animation: animation)
                    FilterGenderButton(button: .Genderless, genderStatus: $selectedGender, animation: animation)
                    FilterGenderButton(button: .Unknown, genderStatus: $selectedGender, animation: animation)
                }
                
                /*
                HStack(spacing: 16) {
                    FilterGenderButton(button: .All, genderStatus: $selectedGender, animation: animation)
                    FilterGenderButton(button: .Male, genderStatus: $selectedGender, animation: animation)
                    FilterGenderButton(button: .Female, genderStatus: $selectedGender, animation: animation)
                    FilterGenderButton(button: .Genderless, genderStatus: $selectedGender, animation: animation)
                    FilterGenderButton(button: .Unknown, genderStatus: $selectedGender, animation: animation)
                }
                */
                
                
                Spacer()
            }
            .padding(8)
        }
        
        
    }
}
