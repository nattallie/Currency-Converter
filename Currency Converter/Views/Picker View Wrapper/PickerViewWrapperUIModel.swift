//
//  PickerViewWrapperUIModel.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 29.06.22.
//

import UIKit

// MARK: - Picker View Wrapper UI Model
struct PickerViewWrapperUIModel {
    // MARK: Layout
    struct Layout {
        static var containerViewMult: CGFloat { 0.6 }
        static var pickerCornerRadis: CGFloat { 12 }
    }
    
    // MARK: Font
    struct Font {
        static var label: UIFont { .systemFont(ofSize: 16) }
    }
    
    // MARK: Color
    struct Color {
        static var shadowColor: UIColor { .lightGray }
        static var pickerBackground: UIColor { .white }
    }
    
    // MARK: Misc
    struct Misc {
        static var labelScaleFactor: CGFloat { 0.5 }
        static var shadowRadius: CGFloat { 20 }
        static var shadowOffset: CGSize { .init(width: 10, height: 10) }
        static var shadowOpacity: Float { 0.8 }
    }
}
