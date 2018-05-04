//
//  Balance.swift
//  Persistency
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Domain

extension Balance: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "autenticacao"
        case value = "saldo"
        case lis = "lis"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        value = try values.decode(Double.self, forKey: .value)
        lis = try values.decode(Double.self, forKey: .lis)
    }
}
