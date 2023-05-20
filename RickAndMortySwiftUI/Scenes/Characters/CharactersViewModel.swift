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
    
    func getData(with searchText: String, status: Status, gender: Gender, species: Species) -> [ResultModel] {
        
        var filteredData: [ResultModel] = []
        
        if searchText.isEmpty {
            filteredData = resultList
        } else {
            filteredData = resultList.filter { ($0.name ?? "").lowercased().contains(searchText.lowercased())}
        }
        
        if status != .All {
            filteredData = filteredData.filter{$0.status?.rawValue.lowercased() == status.rawValue.lowercased()}
        }
        
        if gender != .All {
            filteredData = filteredData.filter{$0.gender?.rawValue.lowercased() == gender.rawValue.lowercased()}
        }
        
        if species != .All {
            filteredData = filteredData.filter{$0.species?.rawValue.lowercased() == species.rawValue.lowercased()}
        }
        
        
        return filteredData
    }
}




