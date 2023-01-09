//
//  SceneDelegateTests.swift
//  Currency ConverterTests
//
//  Created by Nata Khurtsidze on 10.01.23.
//

import XCTest
import Currency_Converter

final class SceneDelegateTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UserDefaults.hasRunBefore = false
    }

    func testUserDefaultsHasRunBefore() {
        XCTAssertFalse(UserDefaults.hasRunBefore)
    }
    
    func testDefaultViewModelWhenAppHasNotRunBefore() {
        let converterViewModel: ConverterViewModel = SceneDelegate.getConverterViewModel()
        XCTAssertEqual(converterViewModel, ConverterViewModel.mock)
    }
    
    func testDefaultViewModelWhenAppHasRunBefore() {
        var converterViewModel: ConverterViewModel = SceneDelegate.getConverterViewModel()
        XCTAssertEqual(converterViewModel, ConverterViewModel.mock)
        
        UserDefaults.hasRunBefore = true
        converterViewModel = .init(
            accountItems: [
                .init(currency: .EUR, amount: 103),
                .init(currency: .USD, amount: 90),
                .init(currency: .JPY, amount: 13)
            ],
            numberOfFreeExchange: 4,
            commissionPercentage: 0.3
        )
        SceneDelegate.syncConverterViewModel(viewModel: converterViewModel)
        
        let converterViewModelRetrieved: ConverterViewModel = SceneDelegate.getConverterViewModel()
        XCTAssertEqual(converterViewModel, converterViewModelRetrieved)
    }
    
    func testDefaultRootViewController() {
        XCTAssertTrue(UIApplication.shared.rootWindow?.rootViewController is ConverterView)
    }
}
