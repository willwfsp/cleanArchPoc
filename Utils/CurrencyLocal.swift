//
//  CurrencyLocal.swift
//  Domain
//
//  Created by Willian on 05/05/2018.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation

public enum CurrencyLocal: String {
    case BRL
    
    public init(rawValue: String) {
        switch rawValue {
        case "BRL": self = .BRL
        default: self = .BRL
        }
    }
    
    public var locale: Locale {
        switch self {
        case .BRL:
            return Locale(identifier: "pt_BR")
        }
    }
}
