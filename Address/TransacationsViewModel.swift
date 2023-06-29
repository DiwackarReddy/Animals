//
//  TransacationsViewModel.swift
//  Address
//
//  Created by Diwakar Reddy  on 26/05/23.
//

import Foundation
import SwiftUI
import API
import FueledUtilsCombine

final class TransationViewModel: ObservableObject {
    private var monetaryTransactions: Action<TransactionsInput,MonetaryTransactionsQuery.Data?, AppError>
    private var nonMonetaryTransactions: Action<TransactionsInput,NonMonetaryTransactionsQuery.Data,AppError>
    private let apiClient = "https://nb-api-dev.fueled.engineering/api/graphql"
    init(){
       // monetaryTransactions = Action(execute: apiClie)
    }
}
