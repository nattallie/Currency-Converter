//
//  PickerViewWrapperDelegate.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 29.06.22.
//

import Foundation

// MARK: Picker View Wrapper Delegate
protocol PickerViewWrapperDelegate: AnyObject {
    var numberOfComponents: Int { get }
    var numberOfCurrencies: Int { get }
    
    func titleForRow(at index: Int) -> String
    func didSelectRow(at index: Int)
}
