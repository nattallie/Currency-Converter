//
//  ConverterInterface.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 26.06.22.
//

import Foundation

// MARK: - Converter View
protocol ConverterView: AnyObject {
    func setTitle(_ title: String)
    func setBalanceTitle(_ title: String)
}

// MARK: - Converter Presentable
protocol ConverterPresentable {
    func viewDidLoad()
}
