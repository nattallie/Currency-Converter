//
//  ConverterViewController.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 26.06.22.
//

import UIKit

// MARK: - Converter View Controller
final class ConverterViewController: UIViewController {
    // MARK: Properties
    var presenter: ConverterPresenter!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Converter View
extension ConverterViewController: ConverterView {}
