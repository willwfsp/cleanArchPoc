//
//  UseCaseTests.swift
//  DomainTests
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import XCTest
import Utils
@testable import Domain

class UseCaseTests: XCTestCase {
    func testTaskExecutionWithForcedFailure() {
        // Given
        let sut = UseCaseSpy()
        sut.shouldReturnSuccess = false
        
        let expectation = self.expectation(description: "expecting failure")
        var result: Result<UseCaseModelSpy> = .success(data: "")
        
        // When
        sut.execute {
            result = $0
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertFalse(result.isSuccess)
    }
    
    func testTaskExecutionWithForcedSuccess() {
        // Given
        let sut = UseCaseSpy()
        sut.shouldReturnSuccess = true
        
        let expectation = self.expectation(description: "expecting success")
        var result: Result<UseCaseModelSpy> = .failure(error: NSError())
        
        // When
        sut.execute {
            result = $0
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertTrue(result.isSuccess)
    }
}
