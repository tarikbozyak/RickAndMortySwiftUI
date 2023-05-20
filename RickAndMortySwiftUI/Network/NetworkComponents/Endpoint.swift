import Foundation

public enum URLType {
    case raw(url: String)
    case component
}

public struct Endpoint {
    let type: URLType
    let path: String
    let queryParameters: [URLQueryItem]
    
    public init(path: String, queryParameters: [URLQueryItem] = [], type: URLType = .component) {
        self.type = type
        self.path = path
        self.queryParameters = queryParameters
    }
}

// MARK: - Endpoint + URL
extension Endpoint {
    func url(with scheme: URLScheme, host: URLHost) throws -> URL {
        switch type{
            
        case .raw(let url):
            guard let url = URL(string: url) else {
                throw NetworkError.invalidRequest
            }
            return url
            
        case .component:
            var components = URLComponents()
            components.scheme = scheme.rawValue
            components.host = host.rawValue
            components.path = path
            
            if !queryParameters.isEmpty {
                components.queryItems = queryParameters
            }
            
            guard let url = components.url else {
                throw NetworkError.invalidRequest
            }
            
            return url
        }
    }
}

extension Endpoint {
    static func characters() -> Self {
        return Endpoint(path: "/api/character")
    }
    
    static func episodes(path: String?) -> Self {
        guard let path = path else {
            return Endpoint(path: "/api/episode")
        }
        return Endpoint(path: path)
    }
    
    static func locations() -> Self {
        return Endpoint(path: "/api/location")
    }
    
    static func detailEndpoint(path: String, id: String) -> Self {
        return Endpoint(path: path, queryParameters: [
            URLQueryItem(name: "id", value: id)
        ])
    }
    
}

