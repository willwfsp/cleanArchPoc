//
//  LocalJsonDataSourceTests.swift
//  Persistency
//
//  Created by Willian on 05/05/2018.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import XCTest
import Utils
@testable import Persistency

extension XCTestCase {
    func waitForExpectation() {
        waitForExpectations(timeout: 1, handler: nil)
    }
}

class LocalJsonDataSourceTests: XCTestCase {
    func testShouldGetNotFoundErrorWhenFileDoesNotExists() {
        // Given
        let sut = LocalJsonDataSource(jsonProvider: JsonProvider())
        let expectation = self.expectation(description: "expecting not found error")
        var error: FileError? = nil
        // When
        sut.get(id: "arquivo não existente") {
            error = $0.error as? FileError
            expectation.fulfill()
        }
        
        waitForExpectation()
        
        // Then
        XCTAssertNotNil(error)
        XCTAssertEqual(error, FileError.notFound)
    }
    
    func testShouldGetParsedJsonObjectWhenFileExistsAndItIsFormattedProperly() {
        // Given
        let sut = LocalJsonDataSource(jsonProvider: JsonProvider())
        let expectation = self.expectation(description: "expecting not found error")
        var json: JsonObject? = nil
        // When
        sut.get(id: "formatted") {
            error = $0.data
            expectation.fulfill()
        }
        
        waitForExpectation()
        
        // Then
        XCTAssertNotNil(json)
    }
}
