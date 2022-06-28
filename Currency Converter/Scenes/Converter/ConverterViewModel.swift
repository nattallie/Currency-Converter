//
//  ConverterViewModel.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import Foundation

// MARK: - Converter View Model
struct ConverterViewModel {
    // MARK: Properties
    let currencyItems: [CurrencyItem]
    let numberOfFreeExchange: Int
    
    // MARK: Mock
    static var mock: ConverterViewModel {
        return .init(
            currencyItems: [
                .init(currency: .EUR, amount: 1000),
                .init(currency: .USD, amount: 0),
                .init(currency: .JPY, amount: 0)
            ],
            numberOfFreeExchange: 5
        )
    }
}
