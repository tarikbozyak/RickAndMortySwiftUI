//
//  LocationsViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 16.04.2023.
//

import Foundation


class LocationsViewModel : ObservableObject {
    
    @Published private(set) var resultList: [LocationModel] = []
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
        
        let request = CategoryHomeRequest.location
        do {
            let data : WelcomeLocation = try await NetworkClient.shared.performRequest(request)
            nextPage = data.info?.next
            guard let resultData = data.results else {return}
            resultList += resultData
        } catch {
            throw NetworkError.handleError(error)
        }
    }
    
    @MainActor
    func fetchNextSetOfLocations() async throws {
        
        guard nextPage != nil else { return }
        
        viewState = .fetching
        defer { viewState = .finished }
        
        let request = PaginationRequest(url: nextPage!)
        do {
            let data : WelcomeLocation = try await NetworkClient.shared.performRequest(request)
            nextPage = data.info?.next
            guard let resultData = data.results else {return}
            resultList += resultData
        } catch {
            throw NetworkError.handleError(error)
        }
    }
    
    func hasReachedEnd(of location: LocationModel) -> Bool{
        resultList.last?.id == location.id
    }
    
}
