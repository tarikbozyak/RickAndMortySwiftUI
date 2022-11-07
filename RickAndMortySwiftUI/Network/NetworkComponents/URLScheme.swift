//
//  URLScheme.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation

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

