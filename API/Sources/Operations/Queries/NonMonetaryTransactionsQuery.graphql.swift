// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class NonMonetaryTransactionsQuery: GraphQLQuery {
  public static let operationName: String = "NonMonetaryTransactions"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query NonMonetaryTransactions($input: TransactionsInput!) {
        nonMonetaryTransactions(input: $input) {
          __typename
          id
          creationDate
          postingDate
          merchantName
          last4CardNumber
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
      .field("nonMonetaryTransactions", [NonMonetaryTransaction].self, arguments: ["input": .variable("input")]),
    ] }

    /// Get members non monetary transactions.
    public var nonMonetaryTransactions: [NonMonetaryTransaction] { __data["nonMonetaryTransactions"] }

    /// NonMonetaryTransaction
    ///
    /// Parent Type: `NonMonetaryTransaction`
    public struct NonMonetaryTransaction: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.NonMonetaryTransaction }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", API.ID.self),
        .field("creationDate", API.DateTime.self),
        .field("postingDate", API.DateTime?.self),
        .field("merchantName", String.self),
        .field("last4CardNumber", String?.self),
      ] }

      /// ID of the event
      public var id: API.ID { __data["id"] }
      /// Date of creation (required)
      public var creationDate: API.DateTime { __data["creationDate"] }
      /// Posting date of the event
      public var postingDate: API.DateTime? { __data["postingDate"] }
      /// Details of the event
      public var merchantName: String { __data["merchantName"] }
      /// Card targeted by the event
      public var last4CardNumber: String? { __data["last4CardNumber"] }
    }
  }
}
