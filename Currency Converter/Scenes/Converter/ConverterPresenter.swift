//
//  ConverterPresenter.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 26.06.22.
//

import Foundation

// MARK: - Converter Presenter
final class ConverterPresenter: ConverterPresentable {
    // MARK: Properties
    var numberOfCurrencies: Int { viewModel.accountItems.count }
    var defaultCurrency: Currency { viewModel.accountItems.first?.currency ?? Currency.EUR }
    var defaultAmount: Double { 0 }
    
    var sellInputTitle: String { Consts.Scenes.Converter.sellTitle }
    var receiveInputTitle: String { Consts.Scenes.Converter.receiveTitle }
    
    private unowned let view: ConverterView
    private let viewModel: ConverterViewModel
    private let converterUseCase: CurrencyConverterUseCase
    
    private var lastSelectedCurrencyInput: CurrencyInputType? = nil
    private var numberOfConversions: Int = 0
    
    // MARK: Initializers
    init(
        view: ConverterView,
        viewModel: ConverterViewModel,
        converterUseCase: CurrencyConverterUseCase
    ) {
        self.view = view
        self.viewModel = viewModel
        self.converterUseCase = converterUseCase
    }
    
    // MARK: Converter Presentable
    func viewDidLoad() {
        view.setTitle(Consts.Scenes.Converter.title)
        view.setBalanceTitle(Consts.Scenes.Converter.balanceTitle)
        view.setAccountItems(viewModel.accountItems)
        view.setCurrencyExchangeTitle(Consts.Scenes.Converter.exchangeTitle)
        view.setButtonTitle(Consts.Scenes.Converter.converterButtonTitle)
        view.setButtonActivity(to: true)
    }
    
    func titleForCurrency(at index: Int) -> String {
        guard (0..<viewModel.accountItems.count).contains(index) else {
            fatalError()
        }
        
        return viewModel.accountItems[index].currency.rawValue
    }
    
    func didChangeAmount(inputType: CurrencyInputType, amount: Double, currency: Currency) {
        // start loading
        var toCurrency: Currency
        var destinationInput: CurrencyInputType
        
        switch inputType {
        case .sell:
            toCurrency = view.receiveCurrency
            destinationInput = .receive
        case .receive:
            toCurrency = view.sellCurrency
            destinationInput = .sell
        }
        
        processConversion(
            fromAmount: amount,
            fromCurrency: currency,
            toCurrency: toCurrency,
            destinationInput: destinationInput
        )
    }
    
    private func processConversion(
        fromAmount: Double,
        fromCurrency: Currency,
        toCurrency: Currency,
        destinationInput: CurrencyInputType
    ) {
        Task {
            await sendConversionCall(
                fromAmount: fromAmount,
                fromCurrency: fromCurrency,
                toCurrency: toCurrency,
                destinationInput: destinationInput
            )
        }
    }
    
    @MainActor private func sendConversionCall(
        fromAmount: Double,
        fromCurrency: Currency,
        toCurrency: Currency,
        destinationInput: CurrencyInputType
    ) async {
        do {
            let conversionEntity: CurrencyConverterEntity? = try await converterUseCase.fetch(
                parameters: .init(
                    fromAmount: fromAmount,
                    fromCurrency: fromCurrency.rawValue,
                    toCurrency: toCurrency.rawValue
                )
            )
            
            guard let conversionEntity = conversionEntity else {
                // error handling
                return
            }

            view.setCurrentAmount(Double(conversionEntity.amount) ?? 0, inputType: destinationInput)
            
            view.setButtonActivity(to: isValidConversion(sellAmount: view.sellAmount, currency: view.sellCurrency))
        } catch {
            // error handling
            print(error)
        }
    }
    
    private func isValidConversion(sellAmount: Double, currency: Currency) -> Bool {
        guard
            let accountIndex = viewModel.accountItems.firstIndex(where: { $0.currency == currency } )
        else {
            return false
        }
        
        var fee: Double = sellAmount * viewModel.commissionPercentage
        if numberOfConversions < viewModel.numberOfFreeExchange {
            fee = 0
        }
        
        return sellAmount <= viewModel.accountItems[accountIndex].amount + fee
    }
    
    func didTapCurrencyButton(inputType: CurrencyInputType) {
        lastSelectedCurrencyInput = inputType
        view.showCurrencySelectorPopUp()
    }
    
    func didSelectCurrency(_ index: Int) {
        view.dismissCurrencySelectorPopUp()
        if let lastSelected = lastSelectedCurrencyInput {
            view.setCurrentCurrency(viewModel.accountItems[index].currency, inputType: lastSelected)
            
            switch lastSelected {
            case .sell:
                processConversion(
                    fromAmount: view.sellAmount,
                    fromCurrency: view.sellCurrency,
                    toCurrency: view.receiveCurrency,
                    destinationInput: .receive
                )
            case .receive:
                processConversion(
                    fromAmount: view.receiveAmount,
                    fromCurrency: view.receiveCurrency,
                    toCurrency: view.sellCurrency,
                    destinationInput: .sell
                )
            }
        }
    }
    
    func didTapSubmitButton() {
        
        numberOfConversions += 1
    }
}
