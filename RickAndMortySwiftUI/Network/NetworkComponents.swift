//
//  NetworkComponents.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 21.05.2023.
//

import Foundation

// MARK: - URLHost
public enum URLHost: String {
    case production = "rickandmortyapi.com"
}

// MARK: - URLScheme
public enum URLScheme {
    case http, https
    case other(scheme: String)
    
    var rawValue: String {
        switch self {
        case .http: return "http"
        case .https: return "https"
        case .other(let scheme): return scheme
        }
    }
}

// MARK: - HTTPMethod
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

// MARK: - ContentType
public enum ContentType {
    case json, xml
    case urlEncoded
    case other(code: String)
    
    var value: String {
        switch self {
        case .json: return "application/json"
        case .xml: return "application/xml"
        case .urlEncoded: return "application/x-www-form-urlencoded"
        case .other(let code): return code
        }
    }
}
