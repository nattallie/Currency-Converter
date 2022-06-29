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
    
    func setCurrencyExchangeTitle(_ title: String)
    func setCurrentCurrency(_ currency: Currency, inputType: CurrencyInputType)
    func showCurrencySelectorPopUp()
    func dismissCurrencySelectorPopUp()
    
    func setButtonTitle(_ title: String)
    func setButtonActivity(to isEnabled: Bool)
}

// MARK: - Converter Presentable
protocol ConverterPresentable {
    var numberOfCurrencies: Int { get }
    var defaultCurrency: Currency { get }
    var defaultAmount: Double { get }
    
    var sellInputTitle: String { get }
    var receiveInputTitle: String { get }
    
    func viewDidLoad()
    
    func titleForCurrency(at index: Int) -> String
    func didTapCurrencyButton(inputType: CurrencyInputType)
    func didSelectCurrency(_ index: Int)
    
    func didTapSubmitButton()
}
