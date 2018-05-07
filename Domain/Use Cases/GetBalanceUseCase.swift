//
//  GetBalanceUseCase.swift
//  Domain
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Utils

public class GetBalanceUseCase: UseCase {
    public typealias T = Balance
    let repository: BalanceRepository
    
    public init(repository: BalanceRepository) {
        self.repository = repository
    }
    
    public func execute(completion: (Result<Balance>) -> ()) {
        repository.getBalance { completion($0) }
    }
}
