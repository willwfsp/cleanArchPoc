//
//  BalanceRepository.swift
//  Persistency
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Domain
import Utils

class BalanceRepository: Domain.BalanceRepository {
    let dataSource: DataSource
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
    
    func getBalance(completion: (Result<Balance>) -> ()) {
        dataSource.get(id: "balance") { jsonResult in
            
        }
    }
    
    func balance(from json: JsonObject) throws -> Balance {
        let decoder = JSONDecoder()
        
        let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        return try decoder.decode(Balance.self, from: data)
    }
}
