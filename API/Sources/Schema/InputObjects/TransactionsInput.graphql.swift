// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// Parameters for filtering transactions.
public struct TransactionsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    startDate: Date,
    endDate: Date
  ) {
    __data = InputDict([
      "startDate": startDate,
      "endDate": endDate
    ])
  }

  /// Start date for the transactions filter
  public var startDate: Date {
    get { __data["startDate"] }
    set { __data["startDate"] = newValue }
  }

  /// End date for the transactions filter
  public var endDate: Date {
    get { __data["endDate"] }
    set { __data["endDate"] = newValue }
  }
}
