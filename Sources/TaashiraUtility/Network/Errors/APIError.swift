public struct APIError: Error {
    public let message: String
    public let errors: [String: [String]]?
}
