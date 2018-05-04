//
//  PersistencyTests.swift
//  PersistencyTests
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import XCTest
import Utils
@testable import Persistency

class JsonDataSourceTests: XCTestCase {
    func testGetMethodShouldReturnAJsonObject() {
        // Given
        let sut = JsonDataSource()
        var json: JsonObject? = nil
        let expectation = self.expectation(description: "expecting to get the json")
        
        // When
        sut.get(id: "test") {
            json = $0.data
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertNotNil(json)
    }
    
    func testShouldParseJsonProperly() {
        // Given
        let sut = JsonDataSource()
        var json: JsonObject? = nil
        let expectation = self.expectation(description: "expecting to parse the json")
        
        // When
        sut.get(id: "test") {
            json = $0.data
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)

        // Then
        XCTAssertNotNil(json)
        XCTAssertNotNil(json!["id"] as! String)
        XCTAssertEqual(json!["id"] as! String, "test")
    }
    
    func testShouldThrowErrorWhenJsonFileDoesNotExist() {
        // Given
        let sut = JsonDataSource()
        var error: FileError? = nil
        let expectation = self.expectation(description: "expecting to not found the file")
        
        // When
        sut.get(id: "non existent file name") {
            error = $0.error as? FileError
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertNotNil(error)
        XCTAssertEqual(error, FileError.notFound)
    }
}


