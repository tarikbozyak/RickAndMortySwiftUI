//
//  Service.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func charactersDataAsync() async throws -> CharacterResponse{
        let request = CategoryHomeRequest.character
        do {
            let response : CharacterResponse = try await NetworkClient.shared.performRequest(request)
            return response
        } catch {
            throw NetworkError.handleError(error)
        }
        
    }
    
    func paginationDataAsync(with url: String) async throws -> CharacterResponse {
        let request = PaginationRequest(url: url)
        do {
            let response : CharacterResponse = try await NetworkClient.shared.performRequest(request)
            return response
        } catch {
            throw NetworkError.handleError(error)
        }
    }
    
}




