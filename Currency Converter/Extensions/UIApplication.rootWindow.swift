//
//  UIApplication.rootView.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 01.07.22.
//

import UIKit

// MARK: - Root View
extension UIApplication {
    var rootWindow: UIWindow? {
        return connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .compactMap { $0.keyWindow }
            .first
    }
}
