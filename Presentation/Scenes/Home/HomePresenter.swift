//
//  HomePresenter.swift
//  Presentation
//
//  Created by Willian Fagner Souza Polici on 07/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation

protocol HomePresentationLogic {
    func presentBalance(response: Home.GetBalance.Response)
}

class HomePresenter: HomePresentationLogic {
    let viewController: HomeDisplayLogic
    
    init(viewController: HomeDisplayLogic) {
        self.viewController = viewController
    }
    
    func presentBalance(response: Home.GetBalance.Response) {
        
    }
}
