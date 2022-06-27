//
//  Consts.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 27.06.22.
//

import Foundation

// MARK: - Consts
struct Consts {
    // MARK: - API
    struct API {
        static let baseURL: String = "http://api.evp.lt"
    }
    
    // MARK: - Scenes
    struct Scenes {
        // MARK: Converter
        struct Converter {
            static let title: String = "Currency Converter"
            static let balanceTitle: String = "My Balances"
            static let exchangeTitle: String = "Currency Exchange"
            
            static let sellTitle: String = "Sell"
            static let receiveTitle: String = "Receive"
            static let converterButtonTitle: String = "Submit"
        }
    }
}
