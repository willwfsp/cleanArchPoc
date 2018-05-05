
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
        dataSource.get(id: "balance") {
            do {
                switch $0 {
                case let .success(data: json):
                    let entity = try BalanceEntity(from: json)
                    let balance = try entity.makeBalance()
                    completion(.success(data:balance))
                case let .failure(error: error):
                    throw error
                }
            } catch {
                completion(.failure(error: error))
            }
            
        }
    }
}
