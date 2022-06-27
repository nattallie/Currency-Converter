//
//  CurrencyConverterEntity.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 27.06.22.
//

import Foundation

// MARK: - Currency Converter Entity
struct CurrencyConverterEntity: Decodable {
    let amount: String
    let currency: String
    
    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case currency = "currency"
    }
}
