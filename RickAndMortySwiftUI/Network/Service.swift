//
//  Service.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation
import Combine

class Service {
    
    static let shared = Service()
    var subscriptions = Set<AnyCancellable>()
    
    
    func getHomeScreen(completion: @escaping((Welcome) -> Void)) {
        let request = CategoryHomeRequest.character
        NetworkClient.shared.performRequest(request)
            .sink(receiveCompletion: NetworkUtils.handleCompletion) { returnedData in
                DispatchQueue.main.async {
                    completion(returnedData)
                }
            }
            .store(in: &subscriptions)
    }
    
    func charactersDataAsync() async throws -> Welcome{
        let request = CategoryHomeRequest.character
        do {
            let response : Welcome = try await NetworkClient.shared.performRequest(request)
            return response
        } catch {
            throw NetworkError.handleError(error)
        }
        
    }
    
    
    
    
    
    
}




