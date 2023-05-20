import Foundation

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

