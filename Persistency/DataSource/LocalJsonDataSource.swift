//
//  BalanceJsonDataSource.swift
//  Persistency
//
//  Created by Willian on 05/05/2018.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Utils

class LocalJsonDataSource: DataSource {
    let jsonProvider: JsonProvider
    
    init(jsonProvider: JsonProvider) {
        self.jsonProvider = jsonProvider
    }
    
    func get(id: String, completion: (Result<JsonObject>) -> ()) {
        do {
            let jsonObject = try jsonProvider.jsonObjectFromLocalFile(named: id)
            completion(.success(data: jsonObject))
        } catch {
            completion(.failure(error: error))
        }
    }
}
