//
//  NetworkClient.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation
import Combine

/// Defines the public interface of the networking layer
protocol NetworkClientProvider {
    typealias ResultCompletion<Value> = (Result<Value, Error>) -> Void
    
    /// Performs the given network request,
    /// - Parameters:
    ///  - request: Defines a network request with all required information
    /// - Returns: A publisher with either Decodable Value or Error
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func performRequest<Value: Codable>(_ request: RequestTask) -> AnyPublisher<Value, Error>
    
    /// Performs the given network request,
    /// - Parameters:
    ///  - request: Defines a network request with all required information
    /// - Returns: A publisher with either Decodable Value or Error
    @available(OSX 12.0, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func performRequest<Value: Codable>(_ request: RequestTask) async throws -> Value
    
    /// Performs the given network request
    /// - Parameters:
    ///  - request: Defines a network request with all required information
    ///  - completion: A completion block returning a Result with either Value or Error. All errors are parsed to NetworkError
    func performRequest<Value: Codable>(_ request: RequestTask, completion: @escaping ResultCompletion<Value>)
}

class NetworkClient {
    /// Shared instance of the network client. Use this as default.
    static let shared = NetworkClient()
    
    /// Property to make network calls
    private let urlSession: URLSession
    
    /// Initializes a new instance of the client
    ///
    /// - Parameter urlSession: Uses default URLSession
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
}

extension NetworkClient: NetworkClientProvider {
    func performRequest<Value>(_ request: RequestTask, completion: @escaping ResultCompletion<Value>) where Value : Codable {
        guard let request = try? request.urlRequest() else {
            return completion(.failure(NetworkError.invalidRequest))
        }
        
        urlSession.dataTask(with: request) { data, response, error in
            guard error == nil else {
                return completion(.failure(NetworkError.invalidRequest))
            }
            
            guard let response = response as? HTTPURLResponse, let data = data else {
                return completion(.failure(NetworkError.unknownError))
            }
            
            guard 200..<300 ~= response.statusCode else {
                return completion(.failure(NetworkError.httpError(response.statusCode)))
            }
            
            guard let value = try? JSONDecoder().decode(Value.self, from: data) else {
                return completion(.failure(NetworkError.decodingError))
            }
            
            return completion(.success(value))
        }.resume()
    }
    
    @available(OSX 12.0, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func performRequest<Value>(_ request: RequestTask) async throws -> Value where Value : Codable {
        guard let request = try? request.urlRequest() else {
            throw NetworkError.invalidRequest
        }
        
        guard let sessionResponse = try? await urlSession.data(for: request) else {
            print("🔥 invalid request", request.url)
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
            print("🔥 decoding error", request.url)
            throw NetworkError.decodingError
        }
        
        print("<*> success")
        return value
    }
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func performRequest<Value: Codable>(_ request: RequestTask) -> AnyPublisher<Value, Error> {
        
        guard let networkRequest = try? request.urlRequest() else {
            return .fail(NetworkError.invalidRequest)
        }
        return urlSession
            .dataTaskPublisher(for: networkRequest)
            .tryMap ({try NetworkUtils.handleURLResponse(output: $0)})
            .decode(type: Value.self, decoder: JSONDecoder())
            .mapError { NetworkError.handleError($0) }
            .eraseToAnyPublisher()
    }
}

