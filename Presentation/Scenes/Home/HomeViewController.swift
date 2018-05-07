//
//  HomeViewController.swift
//  Presentation
//
//  Created by Willian Fagner Souza Polici on 07/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic {
    func displayBalance(viewModel: Home.GetBalance.ViewModel)
}

class HomeViewController: UIViewController {
    
}

extension HomeViewController: HomeDisplayLogic {
    func displayBalance(viewModel: Home.GetBalance.ViewModel) {
        
    }
}
