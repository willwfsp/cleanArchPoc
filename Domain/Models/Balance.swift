//
//  Balance.swift
//  Domain
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Utils

public struct Balance {
    public let id: String?
    public let value: Double?
    public let lis: Double?
}

extension Balance: Equatable {
    public static func ==(lhs: Balance, rhs: Balance) -> Bool {
        return lhs.id == rhs.id
    }
}
