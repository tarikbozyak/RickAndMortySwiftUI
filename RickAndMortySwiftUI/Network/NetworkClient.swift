//
//  NetworkClient.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 21.05.2023.
//

import Foundation

class NetworkClient {
    
    static let shared = NetworkClient()
    private let urlSession: URLSession = .shared
    
    func performRequest<Value>(_ request: RequestModel) async throws -> Value where Value : Codable {
        guard let request = try? request.urlRequest() else {
            throw NetworkError.invalidRequest
        }
        
        guard let sessionResponse = try? await urlSession.data(for: request) else {
            print("🔥 invalid request", request.url?.absoluteString ?? "")
            throw NetworkError.invalidRequest
        }
        
        guard let response = sessionResponse.1 as? HTTPURLResponse else {
            print("🔥 unknownError")
            throw NetworkError.unknownError
        }
        
        guard 200..<300 ~= response.statusCode else {
            throw NetworkError.httpError(response.statusCode)
        }
        
        guard let value = try? JSONDecoder().decode(Value.self, from: sessionResponse.0) else {
            print("🔥 decoding error", request.url?.absoluteString ?? "")
            throw NetworkError.decodingError
        }
        
        return value
    }
    
}
