//
//  APIClint.swift
//  Address
//
//  Created by Diwakar Reddy  on 26/05/23.
//

import Foundation
import Apollo
import Combine
import API

typealias APIResultPublisher<T: GraphQLQuery> = AnyPublisher<T.Data?, AppError>
typealias APIResultMutationPublisher<T: GraphQLMutation> = AnyPublisher<T.Data?, AppError>

protocol APIAccount {
    func monetaryTransactions(input: TransactionsInput) -> APIResultPublisher<MonetaryTransactionsQuery>
    func nonMonetaryTransactions(input: TransactionsInput) -> APIResultPublisher<NonMonetaryTransactionsQuery>
    
}
protocol APIClient: APIAccount {
    
}

typealias ApolloError = Apollo.ResponseCodeInterceptor.ResponseCodeError

enum AppError: Error, CustomStringConvertible {
    case failure(message: String)
    case custom(code: Int, message: String)

    var code: Int {
        switch self {
        case .custom(let code, _):
            return code
        case .failure:
            return 0
        }
    }

    var message: String {
        switch self {
        case .custom(_, let message),
                .failure(let message):
            return message
        }
    }

    var description: String {
        "Code: \(code), Message: \(message)"
    }
}

extension AppError {
    static func handleAPIError(error: Error) -> Self {
        if let graphQLError = error as? ApolloError {
            switch graphQLError {
            case .invalidResponseCode(let response, _):
                return .custom(
                    code: response?.statusCode ?? 0,
                    message: graphQLError.localizedDescription
                )
            }
        } else if let graphQLError = error as? Apollo.GraphQLError {
            return .failure(message: graphQLError.localizedDescription)
        } else {
            return .failure(message: "Unable to parse GraphQL error")
        }
    }
    
}
