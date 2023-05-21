//
//  PaginationRequest.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 13.11.2022.
//

import Foundation

class PaginationRequest: RequestModel {
    
    let url: String

    init(url: String) {
        self.url = url
    }

    var scheme: URLScheme {
        return .https
    }
    
    var host: URLHost {
        return .production
    }
    
    var endpoint: Endpoint {
        return Endpoint(path: "", type: .raw(url: url))
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var contentType: ContentType {
        return .json
    }
    
    var body: Data? {
        return nil
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
