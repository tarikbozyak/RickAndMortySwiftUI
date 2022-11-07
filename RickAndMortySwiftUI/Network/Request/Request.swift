//
//  Request.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation

/// Defines the structure of a network request
struct Request: RequestTask {
    let scheme: URLScheme = .https
    let host: URLHost
    let endpoint: Endpoint
    let method: HTTPMethod = .get
    let contentType: ContentType = .json
    let body: Data? = nil
    let headers: HTTPHeaders? = nil
}


