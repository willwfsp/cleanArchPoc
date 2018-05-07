//
//  CurrencyLocaleTests.swift
//  UtilsTests
//
//  Created by Willian Fagner Souza Polici on 07/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import XCTest
@testable import Utils

class CurrencyLocaleTests: XCTestCase {
    func testDoubleValueShouldFormattedToDefaultCurrencyProperly() {
        // When
        let formattedCurrency = 123.0.currencyString
        
        // Then
        XCTAssertEqual(formattedCurrency, "R$123,00")
    }
    
    func testDoubleValueShouldFormattedToCurrencyProperly() {
        // Given
        let sut = CurrencyLocal.BRL
        
        // When
        let formattedCurrency = 123.0.currencyString(currencyLocal: sut)
        
        // Then
        XCTAssertEqual(formattedCurrency, "R$123,00")
    }
}
