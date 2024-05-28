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
        
        return session
            .dataTaskPublisher(for: urlRequest)
            .print()
            .receive(on: DispatchQueue.main)
            .tryMap { data, response -> T.ResponseType in
                
                print("Raw Response Data before decode: \(String(data: data, encoding: .utf8) ?? "Unable to decode data")")
                let decoder = JSONDecoder()
                print("Raw Response Data after decode: \(String(data: data, encoding: .utf8) ?? "Unable to decode data")")
                
                if let httpResponse = try? decoder.decode(
                    T.ResponseType.self, from: data
                ) {
                    print("Raw Response Data before httpResponse: \(String(describing: httpResponse))")
                    return httpResponse
                }
                let errorResponse = try decoder.decode(APIError.self, from: data)
                print("Raw Response Data before errorResponse: \(String(describing: errorResponse))")
                throw CustomError.firstError(firstErrorMessage: errorResponse.message)
                
            }
            .eraseToAnyPublisher()
    }
}
