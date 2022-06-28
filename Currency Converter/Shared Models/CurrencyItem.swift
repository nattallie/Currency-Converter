//
//  CurrencyItem.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import Foundation

// MARK: - Currency Item
struct CurrencyItem {
    // MARK: Properties
    let currency: Currency
    let amount: Double
    
    var stringRepresentable: String {
        get {
            "\(String(format: "%.2f", amount)) \(currency.symbol)"
        }
    }
}
