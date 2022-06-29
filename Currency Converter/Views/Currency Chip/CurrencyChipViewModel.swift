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
    let accountItem: AccountItem
    
    // MARK: Mock
    static var mock: CurrencyChipViewModel {
        .init(accountItem: .init(currency: .EUR, amount: 0))
    }
}
