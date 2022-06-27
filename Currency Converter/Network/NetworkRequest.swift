//
//  NetworkRequest.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 27.06.22.
//

import Foundation

// MARK: - Network Request
struct NetworkRequest {
    var url: String
    var method: NetworkRequestMethod = .GET
    var pathParameters: [String] = []
    var queryParameters: [String: String] = [:]
}
