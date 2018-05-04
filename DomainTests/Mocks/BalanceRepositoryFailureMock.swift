//
//  BalanceRepositoryFailureMock.swift
//  DomainTests
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
@testable import Utils
@testable import Domain

class BalanceRepositoryFailureMock: BalanceRepository {
    func getBalance(completion: (Result<Balance>) -> ()) {
        completion(.failure(error: BalanceError.couldNotReachAnyBalance))
    }
}
