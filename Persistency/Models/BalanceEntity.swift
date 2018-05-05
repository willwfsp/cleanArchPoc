//
//  Balance.swift
//  Persistency
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Utils

struct BalanceEntity {
    struct Interest {
        let accumulated: Double?
        let monthly: Double?
        let anualy: Double?
        
        private struct Key {
            static let accumulated = "juros_acumulado"
            static let monthly = "mensal"
            static let anualy = "anual"
        }
    }
    
    struct Cost {
        let monthly: Double?
        let anualy: Double?
        
        private struct Key {
            static let monthly = "mensal"
            static let anualy = "anual"
        }
    }
    
    let authentication: String?
    let balance: Double?
    let lis: Double?
    let daysOfUse: Int?
    let lastUpdateDate: Int64?
    let dueDate: Int64?
    let currency: String?
    let interest: Interest?
    let costEffective: Cost?
    
    private struct Key {
        static let authentication = "autenticacao"
        static let balance = "saldo"
        static let lis = "lis"
        static let daysOfUse = "dias_utilizados"
        static let lastUpdateDate = "ultima_atualizacao"
        static let dueDate = "data_vencimento"
        static let currency = "moeda"
        static let interest = "juros"
        static let costEffective = "custo_efetivo"
    }
}

extension BalanceEntity.Interest: ConvertibleFromJson {
    
    init(from json: JsonObject?) throws {
        accumulated = json?[Key.accumulated] as? Double
        monthly = json?[Key.accumulated] as? Double
        anualy = json?[Key.accumulated] as? Double
    }
}

extension BalanceEntity.Cost: ConvertibleFromJson {
    
    init(from json: JsonObject?) throws {
        monthly = json?[Key.monthly] as? Double
        anualy = json?[Key.anualy] as? Double
    }
}

extension BalanceEntity: ConvertibleFromJson {
    
    init(from json: JsonObject?) throws {
        authentication = json?[Key.authentication] as? String
        balance = json?[Key.balance] as? Double
        lis = json?[Key.lis] as? Double
        daysOfUse = json?[Key.daysOfUse] as? Int
        lastUpdateDate = json?[Key.lastUpdateDate] as? Int64
        dueDate = json?[Key.dueDate] as? Int64
        currency = json?[Key.currency] as? String
        interest = try Interest(from: json?[Key.interest] as? JsonObject)
        costEffective = try Cost(from: json?[Key.costEffective] as? JsonObject)
    }
}
