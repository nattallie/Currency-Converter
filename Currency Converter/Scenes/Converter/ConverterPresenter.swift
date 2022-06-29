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
    
    private unowned let view: ConverterView
    private let viewModel: ConverterViewModel
    
    // MARK: Initializers
    init(
        view: ConverterView,
        viewModel: ConverterViewModel
    ) {
        self.view = view
        self.viewModel = viewModel
    }
    
    // MARK: Converter Presentable
    func viewDidLoad() {
        view.setTitle(Consts.Scenes.Converter.title)
        view.setBalanceTitle(Consts.Scenes.Converter.balanceTitle)
        view.setAccountItems(viewModel.accountItems)
        view.setButtonTitle(Consts.Scenes.Converter.converterButtonTitle)
        view.setButtonActivity(to: true)
    }
    
    func titleForCurrency(at index: Int) -> String {
        guard (0..<viewModel.accountItems.count).contains(index) else {
            fatalError()
        }
        
        return viewModel.accountItems[index].currency.rawValue
    }
    
    func didTapCurrencyButton() {
        view.showCurrencySelectorPopUp()
    }
    
    func didSelectCurrency(_ index: Int) {
        view.dismissCurrencySelectorPopUp()
    }
    
    func didTapSubmitButton() {
        
    }
}
