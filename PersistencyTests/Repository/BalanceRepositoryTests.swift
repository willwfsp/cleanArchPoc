//
//  BalanceRepositoryTests.swift
//  PersistencyTests
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import XCTest
import Utils
import Domain
@testable import Persistency

class BalanceRepositoryTests: XCTestCase {
    func test_getBalance_shouldReturnParsedBalanceWhenSuccess() {
        // Given
        let json: JsonObject = [
            "autenticacao" : "teste",
            "saldo" : 1230.0,
            "lis": 5120.0,
            "moeda": "BRL"
        ]
        
        let sut = BalanceRepository(dataSource: JsonStubDataSource(json: json))
        var optionalBalance: Balance? = nil
        let expectation = self.expectation(description: "expecting to get a parsed balance")
        // When
        sut.getBalance {
            optionalBalance = $0.data
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertNotNil(optionalBalance)
        
        guard let balance = optionalBalance else { return }
        
        XCTAssertEqual(balance.id, "teste")
        XCTAssertEqual(balance.value, 1230.0)
        XCTAssertEqual(balance.lis, 5120.0)
        XCTAssertEqual(balance.currency, Currency.BRL)
    }
}

class JsonStubDataSource: DataSource {
    let json: JsonObject
    
    init(json: JsonObject) {
        self.json = json
    }
    func get(id: String, completion: (Result<JsonObject>) -> ()) {
        completion(.success(data: json))
    }
}
