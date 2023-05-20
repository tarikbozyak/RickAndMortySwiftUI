import Foundation

/// Defines the public interface of the networking layer
protocol NetworkClientProvider {
    typealias ResultCompletion<Value> = (Result<Value, Error>) -> Void
    
    /// Performs the given network request,
    /// - Parameters:
    ///  - request: Defines a network request with all required information
    /// - Returns: A publisher with either Decodable Value or Error
    @available(OSX 12.0, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func performRequest<Value: Codable>(_ request: RequestTask) async throws -> Value
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
        
        print("<Network> request : ", response.url , "status code: ",response.statusCode)
        return value
    }
}

