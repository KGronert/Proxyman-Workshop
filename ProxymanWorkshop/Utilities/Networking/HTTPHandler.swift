//
//  NetworkingHandler.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 20/04/2023.
//

import Foundation

/// Responsible for sending URL Requests.
protocol HTTPHandler {
    /// Sends URL request.
    /// - Parameters:
    ///   - request: Data necessary to construct URL Request.
    /// - Returns: Returns a `NetworkTask` containing data.
    func make<T: Decodable>(_ request: Request) async -> NetworkTask<T>
}

final class HTTPHandlerImpl: HTTPHandler {
    private let factory: RequestFactory = resolve()
    private let session: URLSessionWrapper = resolve()
    
    func make<T: Decodable>(_ request: Request) async -> NetworkTask<T> {
        let request = factory.create(request)
        
        let task = Task { () -> T in
            let result = try await session.data(for: request)
            
            return try await handleResponse(data: result.0, response: result.1.asHttpResponse)
        }
        
        return task
    }
    
    private func handleResponse<T: Decodable>(data: Data, response: HTTPURLResponse?) async throws -> T {
        guard let response, response.isSuccess else { throw NetworkError.invalidStatusCode }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw error
        }
    }
}

