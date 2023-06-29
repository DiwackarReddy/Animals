//
//  NBAPIClient.swift
//  Address
//
//  Created by Diwakar Reddy  on 26/05/23.
//

import Foundation
import Combine
import API
import Apollo

final class NBAPIClient {
    static let shared = NBAPIClient()

    let urlSessionClient = URLSessionClient()
    lazy var client: ApolloClient = initAPIClient()

    private init() {}

    private func initAPIClient() -> ApolloClient {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)

        let provider = NetworkInterceptorProvider(store: store, client: urlSessionClient)
        let url = URL(string: "https://nb-api-dev.fueled.engineering/api/graphql")!

        let requestChainTransport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url
        )
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }

    func updateAPIClientType() {
        client = initAPIClient()
    }
}

//extension NBAPIClient {
//    static var serverUrl: String {
//        switch APIClientResolver.shared.apiClientType {
//        case .nations:
//            return "https://nb-api-dev.fueled.engineering/api/graphql"
//        case .fueled:
//            return "https://nb-api-docs.fueled.engineering/mock-graphql"
//        case .local:
//            return ""
//        }
//    }
//}

extension NBAPIClient: APIClient {
    func request<T: GraphQLQuery>(query: T, cachePolicy: CachePolicy = .default) -> AnyPublisher<T.Data?, AppError> {
        return Deferred {
            Future<T.Data?, AppError> { promise in
                NBAPIClient.shared.client.fetch(query: query, cachePolicy: cachePolicy) { result in
                    switch result {
                    case .success(let graphQLResult):
                        if let errors = graphQLResult.errors {
                            let apiErrors = AppError.handleAPIErrors(errors: errors)
                            debugLogger("API Error (Query: \(T.self)) :: \(apiErrors)")
                            promise(.failure(apiErrors))
                        } else {
                            debugLogger("API Response (Query: \(T.self)) :: \(graphQLResult)")
                            promise(.success(graphQLResult.data))
                        }
                    case .failure(let error):
                        let apiError = AppError.handleAPIError(error: error)
                        debugLogger("API Error (Query: \(T.self)) :: \(apiError.description)")
                        promise(.failure(apiError))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }

    func request<T: GraphQLMutation>(mutation: T) -> AnyPublisher<T.Data?, AppError> {
        return Deferred {
            Future<T.Data?, AppError> { promise in
                NBAPIClient.shared.client.perform(mutation: mutation) { result in
                    switch result {
                    case .success(let graphQLResult):
                        if let errors = graphQLResult.errors {
                            let apiErrors = AppError.handleAPIErrors(errors: errors)
                            debugLogger("API Error (Mutation: \(T.self)) :: \(apiErrors)")
                            promise(.failure(apiErrors))
                        } else {
                            debugLogger("API Response (Mutation: \(T.self)) :: \(graphQLResult)")
                            promise(.success(graphQLResult.data))
                        }
                    case .failure(let error):
                        let apiError = AppError.handleAPIError(error: error)
                        debugLogger("API Error (Mutation: \(T.self)) :: \(apiError.description)")
                        promise(.failure(apiError))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
