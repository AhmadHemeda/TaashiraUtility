public struct APIError: Error {
    let message: String
    let errors: [String: [String]]?
}
