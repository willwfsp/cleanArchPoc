//
//  JsonProvider.swift
//  Utils
//
//  Created by Willian on 05/05/2018.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation

public struct JsonProvider {
    public init() {}
    public func jsonObjectFromLocalFile(named fileName: String) throws -> JsonObject {
        
        let path = try FileProvider.init().path(of: fileName, type: FileProvider.Extension.json)
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            guard let jsonObject = jsonResult as? JsonObject else { throw JsonError.isNotASingleObject }
            
            return jsonObject
        } catch {
            throw JsonError.malformed
        }
    }
}
