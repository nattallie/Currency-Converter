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
        static let containerViewMult: CGFloat = 0.6
        static let pickerCornerRadis: CGFloat = 12
    }
    
    // MARK: Font
    struct Font {
        static let label: UIFont = .systemFont(ofSize: 16)
    }
    
    // MARK: Color
    struct Color {
        static let shadowColor: UIColor = .lightGray
        static let pickerBackground: UIColor = .white
    }
    
    // MARK: Misc
    struct Misc {
        static let labelScaleFactor: CGFloat = 0.5
        static let shadowRadius: CGFloat = 20
        static let shadowOffset: CGSize = .init(width: 10, height: 10)
        static let shadowOpacity: Float = 0.8
    }
}
