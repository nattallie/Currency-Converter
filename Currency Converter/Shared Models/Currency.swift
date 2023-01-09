//
//  Currency.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import Foundation

// MARK: - Currency
public enum Currency: String, CaseIterable, Equatable {
    // MARK: Cases
    case USD = "USD"
    case EUR = "EUR"
    case JPY = "JPY"
    
    // MARK: Properties
    public var symbol: String {
        switch self {
        case .USD:
            return "$"
        case .EUR:
            return "€"
        case .JPY:
            return "¥"
        }
    }
    
    var key: String {
        switch self {
        case .USD:
            return "USD_amount"
        case .EUR:
            return "EUR_amount"
        case .JPY:
            return "JPY_amount"
        }
    }
}
