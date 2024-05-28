import Foundation

struct APIErrorResponse: Decodable {
    let message: String
    let errors: [String: [String]]
}

enum APIError: Error {
    case serverError(APIErrorResponse)
}
