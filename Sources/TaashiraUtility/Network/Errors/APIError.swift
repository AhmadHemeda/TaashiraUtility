import Foundation

public struct APIErrorResponse: Decodable {
    let message: String
    let errors: [String: [String]]
}

public enum APIError: Error {
    case serverError(APIErrorResponse)
}
