//
//  Double.swift
//  Utils
//
//  Created by Willian Fagner Souza Polici on 07/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation

public extension Double {
    public var currencyString: String? {
        return currencyString(currencyLocal: .BRL)
    }
    
    public func currencyString(currencyLocal: CurrencyLocal) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = currencyLocal.locale
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber)
    }
}
