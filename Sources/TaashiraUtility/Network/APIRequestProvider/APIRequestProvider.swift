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
            .print()
            .receive(on: DispatchQueue.main)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                
                let decoder = JSONDecoder()
                
                if (200...299).contains(httpResponse.statusCode) {
                    return try decoder.decode(T.ResponseType.self, from: data)
                } else {
                    let apiError = try decoder.decode(APIError.self, from: data)
                    throw apiError
                }
            }
            .eraseToAnyPublisher()
    }
}
