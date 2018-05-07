//
//  HomeInteractorTests.swift
//  PresentationTests
//
//  Created by Willian Fagner Souza Polici on 07/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import XCTest
import Utils
@testable import Domain
@testable import Presentation

class HomeInteractorTests: XCTestCase {
    func testGetBalanceShouldReturnBalanceObject() {
        // Given
        let sut = makeSut(isSuccess: true)

        // When
        sut.getBalance(request: Home.GetBalance.Request())
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertNotNil((sut.presenter as? HomePresenterSpy)?.getBalanceResponse)
    }
    
    func testGetBalanceShouldReturnCouldNotReachAnyBalanceError() {
        // Given
        let sut = makeSut(isSuccess: false)
        let presenter = sut.presenter as? HomePresenterSpy
        
        // When
        sut.getBalance(request: Home.GetBalance.Request())
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertNotNil(presenter?.getBalanceResponse)
        XCTAssertTrue(presenter?.getBalanceResponse?.result.isFailure ?? false)
    }
}

// MARK: Helpers

extension HomeInteractorTests {
    func makeSut(isSuccess: Bool) -> HomeInteractor {
        let useCase = GetBalanceUseCaseSpy(isSuccess: isSuccess)
        let expectation = self.expectation(description: "expecting response from interactor")
        let presenter = HomePresenterSpy(expectation: expectation)
        return HomeInteractor(presenter: presenter, getBalanceUseCase: useCase)
    }
}

// MARK: Spies

extension HomeInteractorTests {
    class HomePresenterSpy: HomePresenter {
        let expectation: XCTestExpectation
        var getBalanceResponse: Home.GetBalance.Response? = nil
        
        class HomeDisplayLogicSpy: HomeDisplayLogic {
            func displayBalance(viewModel: Home.GetBalance.ViewModel.Success) { }
            func displayBalanceError(viewModel: Home.GetBalance.ViewModel.Failure) { }
            init() { }
        }
        
        init(expectation: XCTestExpectation) {
            self.expectation = expectation
            super.init(viewController: HomeDisplayLogicSpy())
        }
        
        override func presentBalance(response: Home.GetBalance.Response) {
            getBalanceResponse = response
            expectation.fulfill()
        }
    }
    
    class GetBalanceUseCaseSpy: GetBalanceUseCase {
        class BalanceRepositorySpy: BalanceRepository {
            init() { }
            func getBalance(completion: (Result<Balance>) -> ()) { }
        }
        
        let isSuccess: Bool
        
        init(isSuccess: Bool) {
            self.isSuccess = isSuccess
            super.init(repository: BalanceRepositorySpy())
        }
        
        override func execute(completion: (Result<Balance>) -> ()) {
            guard isSuccess else {
                completion(.failure(error: BalanceError.couldNotReachAnyBalance))
                return
            }
            let balance = Balance(id: "teste", value: 123.0, lis: 321.0, currency: .BRL)
            completion(.success(data: balance))
        }
    }
}


