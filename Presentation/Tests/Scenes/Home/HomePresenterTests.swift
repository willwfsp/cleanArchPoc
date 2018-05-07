//
//  HomePresenterTests.swift
//  Presentation
//
//  Created by Willian Fagner Souza Polici on 07/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import XCTest
import Domain
import Utils

@testable import Presentation

class HomePresenterTests: XCTestCase {
    func testPresentBalanceShouldReturnSuccessViewModel() {
        // Given
        let balance = Balance(id: "teste", value: 123.0, lis: 321.0, currency: .BRL)
        let result = Result<Balance>.success(data: balance)
        let expectation = self.expectation(description: "expecting to get a viewModel")
        let viewController = HomeViewControllerSpy(expectation: expectation)
        let sut = HomePresenter(viewController: viewController)
        
        // When
        sut.presentBalance(response: Home.GetBalance.Response(result: result))
        
        // Then
        XCTAssertNotNil(viewController.balanceViewModel)
    }
    
    func testPresentBalanceShouldReturnErrorViewModel() {
        
    }
}

extension HomePresenterTests {
    class HomeViewControllerSpy: HomeDisplayLogic {
        var balanceViewModel: Home.GetBalance.ViewModel? = nil
        let expectation: XCTestExpectation

        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }
        
        func displayBalance(viewModel: Home.GetBalance.ViewModel) {
            balanceViewModel = viewModel
        }
    
    }
}
