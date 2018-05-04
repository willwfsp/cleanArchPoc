//
//  JsonDataSource.swift
//  Persistency
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Utils

class JsonDataSource: DataSource {
    typealias T = JsonObject
    typealias I = String
    
    enum JsonFileName: String {
        case balance
    }
    
    func get(id: String, completion: (Result<JsonObject>) -> ()) {
        do {
            let path = try filePath(of: id)
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)

            guard let jsonObject = jsonResult as? JsonObject else { throw JsonError.isNotASingleObject }
            
            completion(.success(data: jsonObject))
        } catch {
            completion(.failure(error: error))
        }
    }
    
    func filePath(of jsonName: String) throws -> String {
        guard let path = Bundle.main.path(forResource: jsonName, ofType: "json")
            else { throw FileError.notFound }
        
        return path
    }
}
