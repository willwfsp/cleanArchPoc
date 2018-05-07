//
//  BalanceMapper.swift
//  Persistency
//
//  Created by Willian on 05/05/2018.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Domain
import Utils

extension BalanceEntity {
    func makeBalance() throws -> Balance {
        guard let id = authentication
            else { throw JsonError.missingField("autenticacao") }
        
        let currency = CurrencyLocal(rawValue: self.currency ?? "")
        return Balance(id: id, value: balance, lis: lis, currency: currency)
    }
}
