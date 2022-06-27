//
//  NetworkClient.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 27.06.22.
//

import Foundation

// MARK: - Network Client
final class NetworkClient {
    // MARK: Properties
    static let shared: NetworkClient = .init()
    
    // MARK: Initializer
    private init() {}
    
    // MARK: Network call
    func send<Entity: Decodable>(request: NetworkRequest) async throws -> Entity {
        // create url request
        let urlRequest: URLRequest = try createURLRequestFrom(request)
        
        guard let url = urlRequest.url else {
            throw NetworkError.invalidURL
        }
        
        // send network call
        let (data, response): (Data, URLResponse) = try await URLSession.shared.data(from: url)
        
        // check response code
        guard
            let httpResponse: HTTPURLResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            throw NetworkError.invalidResponse
        }
        
        // decode data
        do {
            let entity: Entity = try JSONDecoder().decode(Entity.self, from: data)
            return entity
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    // MARK: URL Request builder
    private func createURLRequestFrom(_ networkRequest: NetworkRequest) throws -> URLRequest {
        var endpoint: String = networkRequest.url
        
        // add path parameters
        networkRequest.pathParameters.forEach { endpoint.append("/\($0)") }
        
        // add query parameters
        guard var urlComponents: URLComponents = .init(string: endpoint) else {
            throw NetworkError.invalidEndpoint
        }
        urlComponents.queryItems = networkRequest.queryParameters.map { .init(name: $0, value: $1) }
        
        // get URL from URL Components
        guard let url: URL = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        // create final URL request
        var urlRequest: URLRequest = .init(url: url)
        urlRequest.httpMethod = networkRequest.method.rawValue
        
        return urlRequest
    }
}
