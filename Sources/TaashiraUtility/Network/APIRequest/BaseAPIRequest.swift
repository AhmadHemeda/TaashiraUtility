import Foundation
import Combine

open class BaseAPIRequest<Response: Decodable>: APIRequestProtocol {
    public typealias ResponseType = Response
    public let baseURL: URL
    public let path: String
    public let method: HTTPMethod
    public let headers: [String: String]?
    public let body: Data?
    
    public init(baseURL: URL, path: String, method: HTTPMethod, headers: [String: String]? = nil, body: Data? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
    }
}
