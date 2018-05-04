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
    func testShouldParseBalanceFromJsonObject() {
        // Given
        let sut = BalanceRepository(dataSource: BalanceJsonStubDataSource())
        let json = [
            "id" : "teste",
            "saldo" : 1230.0,
            "lis": 5120.0
        ]
        
        // When
        let balance = sut.balance(from: json)
        
        // Then
        XCTAssertEqual(balance?.id, "teste")
        XCTAssertEqual(balance?.value, 1230.0)
        XCTAssertEqual(balance?.lis, 1230.0)
    }
}

class BalanceJsonStubDataSource: DataSource {
    func get(id: String, completion: (Result<JsonObject>) -> ()) {
        let json = [
            "id" : "teste",
            "saldo" : 1230.0,
            "lis": 5120.0
        ]
        
        completion(.success(data: json))
    }
}
