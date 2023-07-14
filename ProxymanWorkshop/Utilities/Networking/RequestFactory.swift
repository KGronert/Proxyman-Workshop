//
//  RequestFactory.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 01/05/2023.
//

import Foundation

// sourcery: mockable
protocol RequestFactory {
    func create(_ request: Request) -> URLRequest
}

final class RequestFactoryImpl: RequestFactory {
    func create(_ request: Request) -> URLRequest {
        var urlRequest = URLRequest(url: request.url, queryItems: request.queryItems)
        urlRequest.method = request.method
        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        return urlRequest
    }
}
