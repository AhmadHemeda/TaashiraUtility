import Foundation
import Combine

@available(iOS 13.0, *)
open class APIRequestProvider: APIRequestProviderProtocol {
    public static let shared = APIRequestProvider()
    
    private let session: URLSession
    
    private init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    public func makeRequest<T: APIRequestProtocol>(request: T) -> AnyPublisher<T.ResponseType, Error> {
        var urlRequest = URLRequest(url: request.baseURL.appendingPathComponent(request.path))
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body
        
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                print("Raw Response Data: \(String(data: data, encoding: .utf8) ?? "Unable to decode data")")
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NSError(domain: "NetworkingErrorDomain", code: 0, userInfo: nil)
                }
                
                if (200..<300).contains(httpResponse.statusCode) {
                    return data
                } else {
                    let errorResponse = try JSONDecoder().decode(APIErrorResponse.self, from: data)
                    throw APIError.serverError(errorResponse)
                }
            }
            .decode(type: T.ResponseType.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
