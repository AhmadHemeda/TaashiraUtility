public struct APIError: Error, Decodable {
    public let message: String
    public let errors: [String: [String]]?
}
