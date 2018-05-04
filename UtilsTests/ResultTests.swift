//
//  UtilsTests.swift
//  UtilsTests
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import XCTest
@testable import Utils

class ResultTests: XCTestCase {

    func testSuccessShouldPassAnyDataThroughCase() {
        // Given
        let sut = "Given String"
        let result = Result<String>.success(data: sut)
        
        // When
        let disclosuredData = result.data!
        
        // Then
        XCTAssertEqual(sut, disclosuredData)
    }
    
    func testFailureShouldPassAnyErrorThroughCase() {
        // Given
        let sut = ResultErrorSpy.somethingWrong
        let result = Result<String>.failure(error: sut)
        
        // When
        let disclosuredError = result.error as! ResultErrorSpy
        
        // Then
        XCTAssertEqual(sut, disclosuredError)
    }
}

enum ResultErrorSpy: Error {
    case somethingWrong
}
