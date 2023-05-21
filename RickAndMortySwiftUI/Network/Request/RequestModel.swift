import Foundation

public typealias HTTPHeaders = [String: String]

public protocol RequestModel {
    var scheme: URLScheme { get }
    var host: URLHost { get }
    var endpoint: Endpoint { get }
    var method: HTTPMethod { get }
    var contentType: ContentType { get }
    var body: Data? { get }
    var headers: HTTPHeaders? { get }
}

extension RequestModel {
    
    func urlRequest(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeInterval: TimeInterval = 30) throws -> URLRequest {
        let url = try endpoint.url(with: scheme, host: host)
        var urlRequest = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeInterval)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = body
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }
}

