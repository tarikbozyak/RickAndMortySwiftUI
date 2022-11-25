//
//  CategoryHomeRequest.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation

enum CategoryHomeRequest: RequestTask {
    case character
    case episode(path: String?)
    case location
    
    var scheme: URLScheme {
        return .https
    }
    
    var host: URLHost {
        return .production
    }
    
    var endpoint: Endpoint {
        switch self {
        case .character: return .characters()
        case .episode(let path):
            return .episodes(path: path)
        case .location: return .locations()
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .character , .episode, .location :
            return .get
        }
    }
    
    var contentType: ContentType {
        switch self {
        case .character , .episode, .location :
            return .json
        }
    }
    
    var body: Data? {
        return nil
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

