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
            return Consts.Common.invalidEndpoint
        case .invalidURL:
            return Consts.Common.invalidURL
        case .invalidResponse:
            return Consts.Common.invalidResponse
        case .invalidData:
            return Consts.Common.invalidData
        }
    }
}
