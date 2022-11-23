//
//  EpisodesViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 15.11.2022.
//

import Foundation

class EpisodesViewModel : ObservableObject {
    @Published var resultList: [EpisodeModel] = []
    @Published private(set) var viewState: ViewState?
    @Published private(set) var nextPage: String?
    
    var isLoading: Bool {
        viewState == .loading
    }
    
    var isFetching: Bool {
        viewState == .fetching
    }
    
    @MainActor
    func getDatas() async throws {
        viewState = .loading
        defer { viewState = .finished }
        
        let request = CategoryHomeRequest.episode
        do {
            let data : EpisodeResponse = try await NetworkClient.shared.performRequest(request)
            nextPage = data.info?.next
            guard let resultData = data.results else {return}
            resultList += resultData
        } catch {
            throw NetworkError.handleError(error)
        }
    }
    
    @MainActor
    func fetchNextSetOfUsers() async throws {
        
        guard nextPage != nil else { return }
        
        viewState = .fetching
        defer { viewState = .finished }
        
        let request = PaginationRequest(url: nextPage!)
        do {
            let data : EpisodeResponse = try await NetworkClient.shared.performRequest(request)
            nextPage = data.info?.next
            guard let resultData = data.results else {return}
            resultList += resultData
        } catch {
            throw NetworkError.handleError(error)
        }
    }
    
    func hasReachedEnd(of character: EpisodeModel) -> Bool{
        resultList.last?.id == character.id
    }
}
