//
//  BalanceViewTests.swift
//  PresentationTests
//
//  Created by Willian Fagner Souza Polici on 07/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import XCTest
import Utils
@testable import Presentation

class BalanceViewTests: XCTestCase {
    func testShouldInitializeAllPropertiesProperly() {
        // Given
        let sut = BalanceView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        // Then
        XCTAssertNotNil(sut.balanceLabel)
        XCTAssertNotNil(sut.lisLabel)
    }
    
    func testShouldSetTheTextValuesProperly() {
        // Given
        let sut = BalanceView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        // When
        sut.viewModel = BalanceViewModel(value: "value", lis: "lis")
        
        // Then
        XCTAssertEqual(sut.balanceLabel.text, "value")
        XCTAssertEqual(sut.lisLabel.text, "lis")
    }
}
