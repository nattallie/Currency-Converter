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
        static var balanceLabelMarginHor: CGFloat { 24 }
        static var balanceLabelMarginVer: CGFloat { 24 }
        static var currencyItemsSpacing: CGFloat { 8 }
        static var currencyScrollViewMarginBottom: CGFloat { 32 }
    }
    
    // MARK: Color
    struct Color {
        static var background: UIColor { .white }
        static var primary: UIColor { .systemBlue }
        static var title: UIColor { .white }
        static var balance: UIColor { .white }
    }
    
    // MARK: Font
    struct Font {
        static var title: UIFont { .systemFont(ofSize: 24) }
        static var balance: UIFont { .systemFont(ofSize: 16) }
    }
}
