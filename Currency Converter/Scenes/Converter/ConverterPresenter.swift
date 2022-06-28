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
        view.setCurrencyItems(viewModel.currencyItems)
        view.setButtonTitle(Consts.Scenes.Converter.converterButtonTitle)
        view.setButtonActivity(to: true)
    }
    
    func didTapSubmitButton() {
        
    }
}
