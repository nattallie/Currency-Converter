//
//  AccountChipModel.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import UIKit

// MARK: - Account Chip Model
struct AccountChipModel {
    // MARK: Properties
    var layout: Layout = .init()
    var color: Color = .init()
    var font: Font = .init()
    
    // MARK: Layout
    struct Layout {
        let height: CGFloat = 40
        var cornerRadius: CGFloat { height / 2 }
        
        var borderWidth: CGFloat = 2
        
        let marginVer: CGFloat = 12
        let marginHor: CGFloat = 12
    }
    
    // MARK: Color
    struct Color {
        var backgroundColor: UIColor = .white
        var borderColor: UIColor = .blue
        var text: UIColor = .blue
    }
    
    // MARK: Font
    struct Font {
        var text: UIFont = .systemFont(ofSize: 15)
    }
}
