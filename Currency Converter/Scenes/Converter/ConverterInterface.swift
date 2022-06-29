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
    
    func setAccountItems(_ items: [AccountItem])
    func updateAccountItem(at index: Int, _ item: AccountItem)
    
    func showCurrencySelectorPopUp()
    func dismissCurrencySelectorPopUp()
    
    func setButtonTitle(_ title: String)
    func setButtonActivity(to isEnabled: Bool)
}

// MARK: - Converter Presentable
protocol ConverterPresentable {
    var numberOfCurrencies: Int { get }
    
    func viewDidLoad()
    
    func titleForCurrency(at index: Int) -> String
    func didTapCurrencyButton()
    func didSelectCurrency(_ index: Int)
    
    func didTapSubmitButton()
}
