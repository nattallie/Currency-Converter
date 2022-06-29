//
//  CurrencyInputViewModel.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import UIKit

// MARK: - Currency Input View Model
struct CurrencyInputViewModel {
    // MARK: Properties
    let icon: UIImage?
    let title: String?
    let amount: Double
    let selectedCurrency: Currency
}
