//
//  ConverterViewModel.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import Foundation

// MARK: - Converter View Model
public struct ConverterViewModel: Equatable {
    // MARK: Properties
    var accountItems: [AccountItem]
    let numberOfFreeExchange: Int
    let commissionPercentage: Double
    
    public init(
        accountItems: [AccountItem],
        numberOfFreeExchange: Int,
        commissionPercentage: Double
    ) {
        self.accountItems = accountItems
        self.numberOfFreeExchange = numberOfFreeExchange
        self.commissionPercentage = commissionPercentage
    }
    
    // MARK: Mock
    public static var mock: ConverterViewModel = .init(
        accountItems: [
            .init(currency: .EUR, amount: 1000),
            .init(currency: .USD, amount: 0),
            .init(currency: .JPY, amount: 0)
        ],
        numberOfFreeExchange: 5,
        commissionPercentage: 0.7
    )
}
