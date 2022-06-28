//
//  Currency.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import Foundation

// MARK: - Currency
enum Currency: String {
    // MARK: Cases
    case USD = "USD"
    case EUR = "EUR"
    case JPY = "JPY"
    
    // MARK: Properties
    var symbol: String {
        switch self {
        case .USD:
            return "$"
        case .EUR:
            return "€"
        case .JPY:
            return "¥"
        }
    }
}
