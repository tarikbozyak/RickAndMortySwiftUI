//
//  CharactersViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published private(set) var resultList: [ResultModel] = []
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
        
        let request = CategoryHomeRequest.character
        do {
            let data : Welcome = try await NetworkClient.shared.performRequest(request)
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
            let data : Welcome = try await NetworkClient.shared.performRequest(request)
            nextPage = data.info?.next
            guard let resultData = data.results else {return}
            resultList += resultData
        } catch {
            throw NetworkError.handleError(error)
        }
    }
    
    func hasReachedEnd(of character: ResultModel) -> Bool{
        resultList.last?.id == character.id
    }
    
    func getData(with searchText: String, status: Status) -> [ResultModel] {
        
        var filteredData: [ResultModel] = []
        
        if searchText.isEmpty {
            filteredData = resultList
        } else {
            filteredData = resultList.filter { ($0.name ?? "").lowercased().contains(searchText.lowercased())}
        }
        
        switch status {
        case .All:
            break
        case .Alive:
            filteredData = filteredData.filter{$0.status?.rawValue.lowercased() == "Alive".lowercased()}
        case .Dead:
            filteredData = filteredData.filter{$0.status?.rawValue.lowercased() == "Dead".lowercased()}
        case .Unknown:
            filteredData = filteredData.filter{$0.status?.rawValue.lowercased() == "Unknown".lowercased()}
        }
        
        return filteredData
    }
}




