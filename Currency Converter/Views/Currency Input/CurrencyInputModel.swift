//
//  CurrencyInputModel.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import UIKit

// MARK: - Currency Input Model
struct CurrencyInputModel {
    // MARK: Properties
    var layout: Layout = .init()
    var color: Color = .init()
    var font: Font = .init()
    
    // MARK: Layout
    struct Layout {
        let spacing: CGFloat = 8
        let iconDimension: CGSize = .init(width: 40, height: 40)
        
        let inputFieldWidth: CGFloat = 100
    }
    
    // MARK: Color
    struct Color {
        var iconTint: UIColor = .blue
        var inputLabel: UIColor = .blue
        
        var inputTextPositive: UIColor = .green
        var inputTextNegative: UIColor = .red
        var inputTextNeutral: UIColor = .black
    }
    
    // MARK: Font
    struct Font {
        var inputLabel: UIFont = .systemFont(ofSize: 16)
        var currency: UIFont = .systemFont(ofSize: 16)
    }
}
