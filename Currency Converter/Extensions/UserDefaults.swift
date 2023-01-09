//
//  UserDefaults.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 09.01.23.
//

import Foundation

public extension UserDefaults {
    enum Keys {
        static let hasRunBefore: String = "hasRunBefore"
        static let numberOfFreeExchange: String = "numberOfFreeExchange"
        static let commissionPercentage: String = "commissionPercentage"
    }
    
    class var hasRunBefore: Bool {
        get {
            UserDefaults.standard.bool(forKey: Keys.hasRunBefore)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.hasRunBefore)
        }
    }
    
    class var numberOfFreeExchange: Int {
        get {
            UserDefaults.standard.integer(forKey: Keys.numberOfFreeExchange)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.numberOfFreeExchange)
        }
    }
    
    class var commissionPercentage: Double {
        get {
            UserDefaults.standard.double(forKey: Keys.commissionPercentage)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.commissionPercentage)
        }
    }
}
