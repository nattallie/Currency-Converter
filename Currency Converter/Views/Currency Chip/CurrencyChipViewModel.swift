//
//  CurrencyChipViewModel.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import Foundation

// MARK: - Currency Chip View Model
struct CurrencyChipViewModel {
    // MARK: Properties
    let currencyItem: CurrencyItem
    
    // MARK: Mock
    static var mock: CurrencyChipViewModel {
        .init(currencyItem: .init(currency: .EUR, amount: 0))
    }
}
