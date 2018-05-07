//
//  HomeInteractor.swift
//  Presentation
//
//  Created by Willian Fagner Souza Polici on 07/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Domain

protocol HomeBusinessLogic {
    func getBalance(request: Home.GetBalance.Request)
}

class HomeInteractor: HomeBusinessLogic {
    let presenter: HomePresentationLogic
    
    // Use Cases
    let getBalanceUseCase: GetBalanceUseCase
    
    init(presenter: HomePresentationLogic, getBalanceUseCase: GetBalanceUseCase) {
        self.presenter = presenter
        self.getBalanceUseCase = getBalanceUseCase
    }
    
    func getBalance(request: Home.GetBalance.Request) {
        getBalanceUseCase.execute { [weak self] result in
            let response = Home.GetBalance.Response(result: result)
            self?.presenter.presentBalance(response: response)
        }
    }
    
}
