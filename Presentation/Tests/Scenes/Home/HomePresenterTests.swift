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
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        let success = viewController.balanceViewModelSuccess
        XCTAssertNotNil(success)
        XCTAssertEqual(success?.balance.value, "R$123,00")
        XCTAssertEqual(success?.balance.lis, "LIS: R$321,00")
    }
    
    func testPresentBalanceShouldPresentErrorMessages() {
        // Given
        let result = Result<Balance>.failure(error: BalanceError.couldNotReachAnyBalance)
        let expectation = self.expectation(description: "expecting to get a viewModel")
        let viewController = HomeViewControllerSpy(expectation: expectation)
        let sut = HomePresenter(viewController: viewController)
        
        // When
        sut.presentBalance(response: Home.GetBalance.Response(result: result))
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        let failure = viewController.balanceViewModelFailure
        XCTAssertNotNil(failure)
        XCTAssertEqual(failure?.errorMessage, "Não foi possível obter o seu saldo")
    }
    
    func testPresentBalanceShouldPresentGenericErrorMessage() {
        // Given
        let result = Result<Balance>.failure(error: NSError())
        let expectation = self.expectation(description: "expecting to get a viewModel")
        let viewController = HomeViewControllerSpy(expectation: expectation)
        let sut = HomePresenter(viewController: viewController)
        
        // When
        sut.presentBalance(response: Home.GetBalance.Response(result: result))
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        let failure = viewController.balanceViewModelFailure
        XCTAssertNotNil(failure)
        XCTAssertEqual(failure?.errorMessage, "Um erro inesperado aconteceu. Tente novamente mais tarde.")
    }
}

extension HomePresenterTests {
    class HomeViewControllerSpy: HomeDisplayLogic {
        var balanceViewModelSuccess: Home.GetBalance.ViewModel.Success? = nil
        var balanceViewModelFailure: Home.GetBalance.ViewModel.Failure? = nil
        let expectation: XCTestExpectation
        
        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }
        
        func displayBalance(viewModel: Home.GetBalance.ViewModel.Success) {
            balanceViewModelSuccess = viewModel
            expectation.fulfill()
        }
        
        func displayBalanceError(viewModel: Home.GetBalance.ViewModel.Failure) {
            balanceViewModelFailure = viewModel
            expectation.fulfill()
        }
    
    }
}
