//
//  URLRequest+Extenions.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 20/04/2023.
//

import Foundation

extension URLRequest {
    var method: HTTPMethod? {
        get {
            httpMethod.map { $0.lowercased() }.flatMap(HTTPMethod.init)
        }
        
        set {
            httpMethod = newValue?.rawValue.uppercased()
        }
    }
    
    init(url: URL, queryItems: [URLQueryItem]?) {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        
        self.init(url: components?.url)
    }
    
    init(url: URL?) {
        guard let url = url else { fatalError("Failed to create URLRequest") }
        
        self.init(url: url)
    }
}
