//
//  ConverterInterface.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 26.06.22.
//

import Foundation

// MARK: - Converter View
public protocol ConverterView: AnyObject {
    var sellAmount: Double { get }
    var receiveAmount: Double { get }
    
    var sellCurrency: Currency { get }
    var receiveCurrency: Currency { get }
    
    func setTitle(_ title: String)
    func setBalanceTitle(_ title: String)
    
    func setAccountItems(_ items: [AccountItem])
    func updateAccountItem(at index: Int, _ item: AccountItem)
    
    func setCurrencyExchangeTitle(_ title: String)
    func setCurrencyInputActivity(to isEnabled: Bool, inputType: CurrencyInputType)
    func setCurrentAmount(_ amount: Double, inputType: CurrencyInputType)
    func setCurrentCurrency(_ currency: Currency, inputType: CurrencyInputType)
    func showCurrencySelectorPopUp(selectedCurrencyIndex: Int)
    func dismissCurrencySelectorPopUp()
    
    func showAlert(viewModel: AlertViewModel)
    func startLoading()
    func stopLoading()
    
    func setScreenInteraction(to isInteractive: Bool)
    
    func setButtonTitle(_ title: String)
    func setButtonActivity(to isEnabled: Bool)
}

// MARK: - Converter Presentable
public protocol ConverterPresentable {
    var numberOfCurrencies: Int { get }
    var sellCurrency: Currency { get }
    var receiveCurrency: Currency { get }
    var defaultAmount: Double { get }
    
    var sellInputTitle: String { get }
    var receiveInputTitle: String { get }
    
    func viewDidLoad()
    
    func titleForCurrency(at index: Int) -> String
    
    func didChangeAmount(inputType: CurrencyInputType, amount: Double, currency: Currency)
    func isValidConversion(sellAmount: Double, currency: Currency) -> Bool
    func didTapCurrencyButton(inputType: CurrencyInputType)
    func didTapCurrencyInput(inputType: CurrencyInputType)
    func didSelectCurrency(_ index: Int)
    
    func didTapSubmitButton()
}
