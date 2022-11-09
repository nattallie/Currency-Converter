//
//  AccountChipViewModel.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import Foundation

// MARK: - Account Chip View Model
struct AccountChipViewModel {
    // MARK: Properties
    let accountItem: AccountItem
    
    // MARK: Mock
    static var mock: AccountChipViewModel = .init(
        accountItem: .init(currency: .EUR, amount: 0)
    )
}
