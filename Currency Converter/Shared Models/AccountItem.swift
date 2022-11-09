//
//  AccountItem.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import Foundation

// MARK: - Account Item
struct AccountItem {
    // MARK: Properties
    let currency: Currency
    var amount: Double
    
    var stringRepresentable: String {
        get {
            "\(String(format: "%.2f", amount)) \(currency.symbol)"
        }
    }
}
