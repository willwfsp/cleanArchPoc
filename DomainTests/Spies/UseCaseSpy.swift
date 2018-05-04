//
//  UseCaseSpy.swift
//  DomainTests
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Domain
import Utils

typealias UseCaseModelSpy = String

class UseCaseSpy: UseCase {
    typealias T = UseCaseModelSpy
    var shouldReturnSuccess = false
    
    func execute(completion: (Result<UseCaseModelSpy>) -> ()) {
        guard shouldReturnSuccess else {
            completion(.failure(error: NSError()))
            return
        }
        completion(.success(data: ""))
    }
}
