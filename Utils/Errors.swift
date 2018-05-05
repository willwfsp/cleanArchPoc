//
//  Errors.swift
//  Utils
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation

public enum BalanceError: Error {
    case couldNotReachAnyBalance
}

public enum FileError: Error {
    case notFound
}

public enum JsonError: Error {
    case isNotASingleObject
    case malformed
}

public enum ResultError: Error {
    case json(JsonError)
    case file(FileError)
}
