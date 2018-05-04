//
//  BalanceRepository.swift
//  Domain
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Utils

protocol BalanceRepository {
    func getBalance(completion: (Result<Balance>) -> ())
}
