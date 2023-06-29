// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == API.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == API.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return API.Objects.Query
    case "NonMonetaryTransaction": return API.Objects.NonMonetaryTransaction
    case "TransactionsPayload": return API.Objects.TransactionsPayload
    case "Transaction": return API.Objects.Transaction
    case "TransactionFilterAggregate": return API.Objects.TransactionFilterAggregate
    case "TransactionFilter": return API.Objects.TransactionFilter
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}