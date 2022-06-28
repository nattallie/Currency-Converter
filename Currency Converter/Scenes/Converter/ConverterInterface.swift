//
//  ConverterInterface.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 26.06.22.
//

import Foundation

// MARK: - Converter View
protocol ConverterView: AnyObject {
    func setTitle(_ title: String)
    func setBalanceTitle(_ title: String)
    
    func setCurrencyItems(_ items: [CurrencyItem])
    func updateCurrencyItem(at index: Int, _ item: CurrencyItem)
    
    func setButtonTitle(_ title: String)
    func setButtonActivity(to isEnabled: Bool)
}

// MARK: - Converter Presentable
protocol ConverterPresentable {
    func viewDidLoad()
    
    func didTapSubmitButton()
}
