import Foundation

public struct APIErrorResponse: Decodable {
    public let message: String
    public let errors: [String: [String]]
}

public enum APIError: Error {
    case serverError(APIErrorResponse)
}
