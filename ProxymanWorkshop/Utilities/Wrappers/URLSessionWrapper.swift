//
//  URLSession.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 20/04/2023.
//

import Foundation

// sourcery: mockable
/// Abstraction for system `URLSession`.
protocol URLSessionWrapper {
    /// Start a data task with a `URLRequest` using async/await.
    /// - Parameters:
    ///   - Request: The `URLRequest` that the data task should perform.
    /// - Returns: A tuple containing the binary `Data` that was downloaded,
    ///   as well as a `URLResponse` representing the server's response.
    /// - Throws: Any error encountered while performing the data task.
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionWrapper {}
