import Foundation
import Combine

@available(iOS 13.0, *)
public protocol APIRequestProviderProtocol {
    func makeRequest<T: APIRequestProtocol>(request: T) -> AnyPublisher<T.ResponseType, Error>
}
