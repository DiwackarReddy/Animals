// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MonetaryTransactionsQuery: GraphQLQuery {
  public static let operationName: String = "MonetaryTransactions"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query MonetaryTransactions($input: TransactionsInput!) {
        transactions(input: $input) {
          __typename
          items {
            __typename
            id
            amount
            type
            status
            creationDate
            postingDate
            merchantName
            walletCode
            last4CardNumber
            benefitPeriod
          }
          filters {
            __typename
            types {
              __typename
              id
              title
            }
            wallets {
              __typename
              id
              title
            }
          }
        }
      }
      """#
    ))

  public var input: TransactionsInput

  public init(input: TransactionsInput) {
    self.input = input
  }

  public var __variables: Variables? { ["input": input] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("transactions", Transactions.self, arguments: ["input": .variable("input")]),
    ] }

    /// Get members monetary transactions.
    public var transactions: Transactions { __data["transactions"] }

    /// Transactions
    ///
    /// Parent Type: `TransactionsPayload`
    public struct Transactions: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.TransactionsPayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("items", [Item].self),
        .field("filters", Filters.self),
      ] }

      /// List of transactions.
      public var items: [Item] { __data["items"] }
      /// Summary of wallets and types for front-end filtering of the results.
      public var filters: Filters { __data["filters"] }

      /// Transactions.Item
      ///
      /// Parent Type: `Transaction`
      public struct Item: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.Transaction }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", API.ID.self),
          .field("amount", API.Decimal.self),
          .field("type", String.self),
          .field("status", GraphQLEnum<API.TransactionStatus>.self),
          .field("creationDate", API.DateTime.self),
          .field("postingDate", API.DateTime?.self),
          .field("merchantName", String.self),
          .field("walletCode", String.self),
          .field("last4CardNumber", String?.self),
          .field("benefitPeriod", String?.self),
        ] }

        /// ID of the transaction
        public var id: API.ID { __data["id"] }
        /// Transaction amount (required)
        public var amount: API.Decimal { __data["amount"] }
        /// Transaction reason (required)
        public var type: String { __data["type"] }
        /// Transaction status (required)
        public var status: GraphQLEnum<API.TransactionStatus> { __data["status"] }
        /// Date of creation (required)
        public var creationDate: API.DateTime { __data["creationDate"] }
        /// Posting date of the transaction
        public var postingDate: API.DateTime? { __data["postingDate"] }
        /// Details on the transaction
        public var merchantName: String { __data["merchantName"] }
        /// Wallet used on the transaction (required)
        public var walletCode: String { __data["walletCode"] }
        /// Card used on the transaction
        public var last4CardNumber: String? { __data["last4CardNumber"] }
        /// Benefit period for the transaction
        public var benefitPeriod: String? { __data["benefitPeriod"] }
      }

      /// Transactions.Filters
      ///
      /// Parent Type: `TransactionFilterAggregate`
      public struct Filters: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.TransactionFilterAggregate }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("types", [Type_SelectionSet].self),
          .field("wallets", [Wallet].self),
        ] }

        /// List of all unique transaction types on the transactions/
        public var types: [Type_SelectionSet] { __data["types"] }
        /// List of all unique wallets used on the transactions.
        public var wallets: [Wallet] { __data["wallets"] }

        /// Transactions.Filters.Type_SelectionSet
        ///
        /// Parent Type: `TransactionFilter`
        public struct Type_SelectionSet: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.TransactionFilter }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", API.ID.self),
            .field("title", String.self),
          ] }

          /// Unique value of the filter
          public var id: API.ID { __data["id"] }
          /// Display value of the filter.
          public var title: String { __data["title"] }
        }

        /// Transactions.Filters.Wallet
        ///
        /// Parent Type: `TransactionFilter`
        public struct Wallet: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.TransactionFilter }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", API.ID.self),
            .field("title", String.self),
          ] }

          /// Unique value of the filter
          public var id: API.ID { __data["id"] }
          /// Display value of the filter.
          public var title: String { __data["title"] }
        }
      }
    }
  }
}
