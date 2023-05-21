import Foundation

struct Request: RequestModel {
    let scheme: URLScheme = .https
    let host: URLHost
    let endpoint: Endpoint
    let method: HTTPMethod = .get
    let contentType: ContentType = .json
    let body: Data? = nil
    let headers: HTTPHeaders? = nil
}


