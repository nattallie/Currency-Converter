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
        static var topContainerCornerRadius: CGFloat { 24 }
        
        static var marginLeft: CGFloat { 8 }
        
        static var titleLabelMarginVer: CGFloat { 64 }
        
        static var balanceLabelMarginHor: CGFloat { 12 }
        static var balanceLabelMarginVer: CGFloat { 24 }
        
        static var accountItemsSpacing: CGFloat { 8 }
        static var accountScrollViewMarginHor: CGFloat { 2 }
        static var accountItemsMarginVer: CGFloat { 16 }
        static var accountScrollViewMarginBottom: CGFloat { 32 }
        
        static var submitButtonWidthMult: CGFloat { 0.5 }
        static var submitButtonHeight: CGFloat { 48 }
        static var submitButtonMarginVer: CGFloat { 40 }
        static var submitButtonCornerRadius: CGFloat { submitButtonHeight / 2 }
    }
    
    // MARK: Color
    struct Color {
        static var background: UIColor { .white }
        
        static var primary: UIColor { .systemBlue }
        
        static var title: UIColor { .white }
        static var balance: UIColor { .white }
        
        static var buttonTitle: UIColor { .white }
        static var buttonEnabled: UIColor { primary }
        static var buttonDisabled: UIColor { .lightGray }
    }
    
    // MARK: Font
    struct Font {
        static var title: UIFont { .systemFont(ofSize: 24) }
        static var balance: UIFont { .systemFont(ofSize: 16) }
    }
}
