//
//  BalanceRepositorySuccessMock.swift
//  DomainTests
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
@testable import Utils
@testable import Domain

class BalanceRepositorySuccessMock: BalanceRepository {
    func getBalance(completion: (Result<Balance>) -> ()) {
        completion(.success(data: Balance(id: "teste", value: 123.0, lis: 123.0, currency: .BRL)))
    }
}
