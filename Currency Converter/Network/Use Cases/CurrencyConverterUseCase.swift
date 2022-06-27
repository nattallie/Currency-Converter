//
//  CurrencyConverterUseCase.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 27.06.22.
//

import Foundation

// MARK: - Currency Converter Use Case
protocol CurrencyConverterUseCase {
    func fetch(
        parameters: CurrencyConverterParameters
    ) async throws -> CurrencyConverterEntity?
}

// MARK: - Currency Converter Use Case Implementation
final class CurrencyConverterUseCaseImpl: CurrencyConverterUseCase {
    func fetch(
        parameters: CurrencyConverterParameters
    ) async throws -> CurrencyConverterEntity? {
        let networkRequest: NetworkRequest = .init(
            url: Consts.API.baseURL,
            pathParameters: [
                "currency",
                "commercial",
                "exchange",
                "\(parameters.fromAmount)-\(parameters.fromCurrency)",
                parameters.toCurrency,
                "latest"
            ]
        )
        
        do {
            let entity: CurrencyConverterEntity = try await NetworkClient.shared.send(request: networkRequest)
            return entity
        } catch {
            throw error
        }
    }
}
