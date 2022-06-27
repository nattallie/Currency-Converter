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
}
