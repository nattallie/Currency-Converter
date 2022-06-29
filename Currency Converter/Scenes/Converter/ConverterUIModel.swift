//
//  ConverterUIModel.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 26.06.22.
//

import UIKit

// MARK: Converter UI Model
struct ConverterUIModel {
    // MARK: Initializers
    private init() {}
    
    // MARK: Layout
    struct Layout {
        static let topContainerCornerRadius: CGFloat = 24
        
        static let marginLeft: CGFloat = 8
        
        static let titleLabelMarginVer: CGFloat = 64
        
        static let balanceLabelMarginHor: CGFloat = 12
        static let balanceLabelMarginVer: CGFloat = 24
        
        static let accountItemsSpacing: CGFloat = 8
        static let accountScrollViewMarginHor: CGFloat = 2
        static let accountItemsMarginVer: CGFloat = 16
        static let accountScrollViewMarginBottom: CGFloat = 32
        
        static var currencyExchangeLabelMarginHor: CGFloat { balanceLabelMarginHor }
        static let currencyExchangeLabelMarginVer: CGFloat = 32

        static let currencyInputStackSpacing: CGFloat = 8
        static var currencyInputStackMarginHor: CGFloat { currencyExchangeLabelMarginHor }
        static var currencyInputStackMarginVer: CGFloat = 8
        
        static let submitButtonWidthMult: CGFloat = 0.5
        static let submitButtonHeight: CGFloat = 48
        static let submitButtonMarginVer: CGFloat = 40
        static var submitButtonCornerRadius: CGFloat { submitButtonHeight / 2 }
    }
    
    // MARK: Color
    struct Color {
        static let background: UIColor = .white
        
        static let primary: UIColor = .systemBlue
        
        static let title: UIColor = .white
        static let balance: UIColor = .white
        
        static var currencyExchange: UIColor { primary }
        static let sellInputText: UIColor = .red
        static let receiveInputText: UIColor = .green
        
        static let buttonTitle: UIColor = .white
        static let buttonEnabled: UIColor = primary
        static let buttonDisabled: UIColor = .lightGray
    }
    
    // MARK: Font
    struct Font {
        static let title: UIFont = .boldSystemFont(ofSize: 24)
        static let balance: UIFont = .systemFont(ofSize: 16)
        static var currencyExchange: UIFont { balance }
    }
}
