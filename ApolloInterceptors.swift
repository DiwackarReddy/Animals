//
//  ApolloInterceptors.swift
//  Address
//
//  Created by Diwakar Reddy  on 26/05/23.
//

import Foundation
import Apollo
import API

struct NetworkInterceptorProvider: InterceptorProvider {
    private let store: ApolloStore
    private let client: URLSessionClient

    init(store: ApolloStore, client: URLSessionClient) {
        self.store = store
        self.client = client
    }

    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            MaxRetryInterceptor(),
            CacheReadInterceptor(store: self.store),
            DebugHeadersInterceptor(),
            UserManagementInterceptor(),
            RequestLoggingInterceptor(),
            NetworkFetchInterceptor(client: self.client),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor(),
            AutomaticPersistedQueryInterceptor(),
            CacheWriteInterceptor(store: self.store)
        ]
    }
}

class RequestLoggingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        debugLogger("Outgoing request: \(request)")
        chain.proceedAsync(
            request: request,
            response: response,
            completion: completion
        )
    }
}

class UserManagementInterceptor: ApolloInterceptor {
    enum UserError: Error {
        case noUserLoggedIn
    }

    private func addTokenAndProceed<Operation: GraphQLOperation>(
        _ token: String?,
        to request: HTTPRequest<Operation>,
        chain: RequestChain,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        if let token {
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
        }
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        addTokenAndProceed(
            AppManager.shared.authParams?.accessToken,
            to: request,
            chain: chain,
            response: response,
            completion: completion
        )
    }
}

class DebugHeadersInterceptor: ApolloInterceptor {

    let debugHeaders: [(operationName: String, headerName: String, headerValue: String)] = []

    /*
     Example debug headers, useful for development testing
     [(operationName: "Carrier", headerName: "mock-php-state", headerValue: "CARRIER_PHP_DISABLED")] forces carrierQuery to respond with personalHealthProfileEnabled = false
     [(operationName: "Carrier", headerName: "mock-php-state", headerValue: "MEMBER_HC_NOT_SELECTED")] forces memberQuery to respond with hasSelectedHealthConditions = false, healthConditions = nil
     [(operationName: "Carrier", headerName: "mock-php-state", headerValue: "MEMBER_HC_EMPTY")] forces carrier query to respond with hasSelectedHealthConditions = true, healthConditions = []
     */

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        if let thisOperationName = request.additionalHeaders["X-APOLLO-OPERATION-NAME"] {
            for debugHeader in debugHeaders.filter({ $0.operationName == thisOperationName }) {
                request.addHeader(name: debugHeader.headerName, value: debugHeader.headerValue)
            }
        }
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}

func debugLogger(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    guard AppEnvironment.environment == .develop else {
        return
    }
    print(items, separator: separator, terminator: terminator)
}
