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
        print("HHHHHHHHH \(request.headers)")
        urlRequest.httpBody = request.body
        let jsonString = String(data: urlRequest.httpBody!, encoding: .utf8)
                print("Request Bodyyyyyyy: \(jsonString)")
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                    throw NSError(domain: "NetworkingErrorDomain", code: 0, userInfo: nil)
                }
                return data
            }
            .decode(type: T.ResponseType.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
