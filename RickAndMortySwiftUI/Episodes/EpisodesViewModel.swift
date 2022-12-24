//
//  EpisodesViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 15.11.2022.
//

import Foundation

class EpisodesViewModel : ObservableObject {
    
    var resultList: [EpisodeModel] = []
    @Published var result: [[EpisodeModel]] = []
    
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
        
        let request = CategoryHomeRequest.episode(path: nil)
        do {
            let data : EpisodeResponse = try await NetworkClient.shared.performRequest(request)
            nextPage = data.info?.next
            guard let resultData = data.results else {return}
            resultList += resultData
        } catch {
            throw NetworkError.handleError(error)
        }
        
        try await getPaginationData()
        await categoriseData()
    }
    
    @MainActor
    func categoriseData() async {
        result += Dictionary(grouping: resultList) { $0.episode?.getEpisodeInfo().0 }.values.map({$0}).sorted {
            ($0.first?.episode?.getEpisodeInfo().0) ?? 0 < ($1.first?.episode?.getEpisodeInfo().0) ?? 0
        }
    }
    
    @MainActor
    func getPaginationData() async throws {
        repeat{
            let request = PaginationRequest(url: nextPage!)
            do {
                let data : EpisodeResponse = try await NetworkClient.shared.performRequest(request)
                nextPage = data.info?.next
                guard let resultData = data.results else {return}
                resultList += resultData
            } catch {
                throw NetworkError.handleError(error)
            }
        } while nextPage != nil
        
    }
    
    func hasReachedEnd(of character: EpisodeModel) -> Bool{
        resultList.last?.id == character.id
    }
}
