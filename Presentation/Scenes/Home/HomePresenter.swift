//
//  HomePresenter.swift
//  Presentation
//
//  Created by Willian Fagner Souza Polici on 07/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Domain
import Utils

protocol HomePresentationLogic {
    func presentBalance(response: Home.GetBalance.Response)
}

class HomePresenter: HomePresentationLogic {
    let viewController: HomeDisplayLogic
    
    init(viewController: HomeDisplayLogic) {
        self.viewController = viewController
    }

    func presentBalance(response: Home.GetBalance.Response) {
        switch response.result {
        case let .success(balance):
            let success = Home.GetBalance.ViewModel.Success.make(balance: balance)
            viewController.displayBalance(viewModel: success)
        case let .failure(error):
            let message: String
            if case .couldNotReachAnyBalance? = (error as? BalanceError) {
                message = "Não foi possível obter o seu saldo"
            } else {
                message = "Um erro inesperado aconteceu. Tente novamente mais tarde."
            }
            let viewModel = Home.GetBalance.ViewModel.Failure(errorMessage: message)
            viewController.displayBalanceError(viewModel: viewModel)
        }
    }
}

extension Home.GetBalance.ViewModel.Success {
    static func make(balance: Balance) -> Home.GetBalance.ViewModel.Success {
        let balanceViewModel = BalanceViewModel(value: balance.value?.currencyString ?? "",
                                                lis: "LIS: \(balance.lis?.currencyString ?? "")")
        let success = Home.GetBalance.ViewModel.Success(balance: balanceViewModel)
        return success
    }
}
