//
//  Account.swift
//  Address
//
//  Created by Diwakar Reddy  on 26/05/23.
//

import API

func nonMonetaryTransacations(inPut: TransactionsInput) -> APIResultPublisher<NonMonetaryTransactionsQuery> {
    NBAPIClient.shared.request(query: NonMonetaryTransactionsQuery(input: inPut),cachePolicy: .fetchIgnoringCacheData)
}

func monetaryTransations(inPut: TransactionsInput) -> APIResultPublisher<MonetaryTransactionsQuery> {
    NBAPIClient.shared.request(query: MonetaryTransactionsQuery(input: inPut),cachePolicy: .fetchIgnoringCacheData)
}
