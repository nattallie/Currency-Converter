//
//  NSLayoutConstraint.reference.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 30.06.22.
//

import UIKit

// MARK: - reference
extension NSLayoutConstraint {
    func reference(in property: inout NSLayoutConstraint?) -> NSLayoutConstraint {
        property = self
        return self
    }
}
