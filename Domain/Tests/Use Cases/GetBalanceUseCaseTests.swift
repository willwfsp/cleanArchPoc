//
//  GetBalanceUseCaseTests.swift
//  DomainTests
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import XCTest
import Utils
@testable import Domain

class GetBalanceUseCaseTests: XCTestCase {
    func testExecuteShouldReturnAParsedBalanceModelWhenSuccess() {
        // Given
        let sut = GetBalanceUseCase(repository: BalanceRepositorySuccessMock())
        
        var result: Result<Balance>!
        let balance = Balance(id: "teste", value: nil, lis: nil, currency: nil)
        let expectation = self.expectation(description: "expecting result callback")
        
        // When
        sut.execute() {
            result = $0
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        let disclosuredData = result.data
        XCTAssertNotNil(disclosuredData)
        XCTAssertEqual(disclosuredData, balance)
    }
    
    func testExecuteShouldReturnARepositoryError() {
        // Given
        let sut = GetBalanceUseCase(repository: BalanceRepositoryFailureMock())

        var result: Result<Balance>!
        let expectation = self.expectation(description: "expecting result callback")

        // When
        sut.execute() {
            result = $0
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)

        // Then
        let disclosuredError = result.error
        XCTAssertNotNil(disclosuredError)
        XCTAssert(disclosuredError is BalanceError)
        XCTAssertEqual(disclosuredError as! BalanceError, BalanceError.couldNotReachAnyBalance)
    }
}



