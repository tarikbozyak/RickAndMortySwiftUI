//
//  CharactersViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published var resultList: [ResultModel] = []
    
    func getDatas() async throws {
        let request = CategoryHomeRequest.character
        let data: Welcome = try await NetworkClient.shared.performRequest(request)
        guard let resultData = data.results else {return}
        await MainActor.run(body: {
            for item in resultData {
                resultList.append(item)
            }
        })
    }
}
