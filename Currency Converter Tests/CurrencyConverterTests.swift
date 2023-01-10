//
//  CurrencyConverterTests.swift
//  Currency ConverterTests
//
//  Created by Nata Khurtsidze on 10.01.23.
//

import XCTest
import Currency_Converter

final class CurrencyConverterTests: XCTestCase {
    var converterViewController: ConverterViewController = ConverterFactory.create(viewModel: .mock) as! ConverterViewController
    
    override func setUp() {
        super.setUp()
        
        converterViewController = ConverterFactory.create(viewModel: .mock) as! ConverterViewController
    }
    
    func testCurrencyChipsCount() {
        XCTAssertEqual(converterViewController.presenter.numberOfCurrencies, Currency.allCases.count)
    }
    
    func testDefaultAmountsOfInputFields() {
        XCTAssertEqual(converterViewController.receiveAmount, converterViewController.sellAmount)
        XCTAssertEqual(converterViewController.receiveAmount, converterViewController.presenter.defaultAmount)
    }
    
    func testAmountsOfInputFields() {
        converterViewController.setCurrentAmount(100, inputType: .sell)
        converterViewController.setCurrentCurrency(.EUR, inputType: .sell)
        
        converterViewController.setCurrentAmount(50, inputType: .receive)
        converterViewController.setCurrentCurrency(.USD, inputType: .receive)
        
        XCTAssertEqual(converterViewController.sellAmount, 100)
        XCTAssertEqual(converterViewController.receiveAmount, 50)
    }
    
    func testIfSellAmountIsValid() {
        let viewModel: ConverterViewModel = .init(
            accountItems: [
                .init(currency: .EUR, amount: 1000),
                .init(currency: .USD, amount: 50),
                .init(currency: .JPY, amount: 500)
            ],
            numberOfFreeExchange: 5,
            commissionPercentage: 0.7
        )
        converterViewController = ConverterFactory.create(viewModel: viewModel) as! ConverterViewController
        
        XCTAssert(converterViewController.presenter.isValidConversion(sellAmount: 100, currency: .EUR))
        XCTAssertFalse(converterViewController.presenter.isValidConversion(sellAmount: 100, currency: .USD))
    }
}
