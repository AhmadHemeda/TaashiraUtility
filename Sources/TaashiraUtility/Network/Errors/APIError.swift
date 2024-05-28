import Foundation

public struct APIError: Decodable {
    public let message: String
    public let errors: [String: [String]]?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case errors = "errors"
    }
}

enum CustomError: Error {
    case firstError(firstErrorMessage: String)
    case invalidUrl
    case unexpected(code: Int)
}

extension CustomError: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .firstError(let firstErrorMessage):
            return "First error message \(firstErrorMessage)"
        case .invalidUrl:
            return "There is a problem with a URL, such as an invalid URL or a timeout."
        case .unexpected(let code):
            return "There is an unexpected error with the code \(code)"
        }
    }
}

extension CustomError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .firstError(let firstErrorMessage):
            return NSLocalizedString("There is an unexpected error with the first error message \(firstErrorMessage)", comment: "Unexpected Error")
            
        case .invalidUrl:
            return NSLocalizedString("There is a problem with a URL, such as an invalid URL or a timeout.", comment: "Invalid URL")
            
        case .unexpected(let code):
            return NSLocalizedString("There is an unexpected error with the code \(code)", comment: "Unexpected Error")
        }
    }
}
