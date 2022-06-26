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
    
    // MARK: Initializers
    init(
        view: ConverterView
    ) {
        self.view = view
    }
}