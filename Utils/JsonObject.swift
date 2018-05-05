//
//  JSONObject.swift
//  Utils
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
public typealias JsonObject = [String : Any?]
public typealias JsonArray = [JsonObject]

public protocol ConvertibleFromJson {
    init(from json: JsonObject?) throws
}
