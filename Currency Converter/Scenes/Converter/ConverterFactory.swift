//
//  ConverterFactory.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 26.06.22.
//

import UIKit

// MARK: - Converter Factory
public struct ConverterFactory {
    // MARK: Initializers
    private init() {}
    
    // MARK: Factory
    public static func create(viewModel: ConverterViewModel = .mock) -> UIViewController {
        let viewController: ConverterViewController = .init()
        
        let presenter: ConverterPresenter = .init(
            view: viewController,
            viewModel: viewModel,
            converterUseCase: CurrencyConverterUseCaseImpl()
        )
        
        viewController.presenter = presenter
        
        return viewController
    }
}
