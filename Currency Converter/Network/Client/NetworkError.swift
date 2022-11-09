//
//  NetworkError.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 27.06.22.
//

import Foundation

// MARK: - Network Error
enum NetworkError: LocalizedError {
    case invalidEndpoint
    case invalidURL
    case invalidResponse
    case invalidData
    
    var localizedDescription: String {
        switch self {
        case .invalidEndpoint:
            return Consts.Network.invalidEndpoint
        case .invalidURL:
            return Consts.Network.invalidURL
        case .invalidResponse:
            return Consts.Network.invalidResponse
        case .invalidData:
            return Consts.Network.invalidData
        }
    }
}
