//
//  NetworkError.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation

public enum NetworkError: LocalizedError, Equatable {
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError
    case invalidJSON(_ error: String)
    case urlSessionFailed(_ error: URLError)
    case unknownError
}

public extension NetworkError {
    /// Parses a HTTP StatusCode and returns a proper error
    /// - Parameter statusCode: HTTP status code
    /// - Returns: Mapped Error
    static func httpError(_ statusCode: Int) -> NetworkError {
        print("[🔥] HTTP Error, status code: \(statusCode)")
        switch statusCode {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 402, 405...499: return .error4xx(statusCode)
        case 500: return .serverError
        case 501...599: return .error5xx(statusCode)
        default: return .unknownError
        }
    }
    
    /// Parses URLSession Publisher errors and return proper ones
    /// - Parameter error: URLSession publisher error
    /// - Returns: Readable NetworkRequestError
    static func handleError(_ error: Error) -> NetworkError {
        print("[🔥] handle error")
        switch error {
        case is Swift.DecodingError:
            let error = error as! DecodingError
            switch error {
            case .typeMismatch(let key, let value):
                print("<error> typeMismatch \(key), value \(value)")
            case .valueNotFound(let key, let value):
                print("<error> valueNotFound \(key), value \(value)")
            case .keyNotFound(let key, let value):
                print("<error> keyNotFound \(key), value \(value)")
            case .dataCorrupted(let value):
                print("<error> dataCorrupted , value \(value)")
            @unknown default:
                print("<error> unknown handleError")
            }
            return .decodingError
        case let urlError as URLError:
            return .urlSessionFailed(urlError)
        case let error as NetworkError:
            return error
        default:
            return .unknownError
        }
    }
}

