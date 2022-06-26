//
//  ConverterFactory.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 26.06.22.
//

import UIKit

// MARK: - Converter Factory
struct ConverterFactory {
    // MARK: Initializers
    private init() {}
    
    // MARK: Factory
    static func create() -> UIViewController {
        let viewController: ConverterViewController = .init()
        
        let presenter: ConverterPresenter = .init(
            view: viewController
        )
        
        viewController.presenter = presenter
        
        return viewController
    }
}
