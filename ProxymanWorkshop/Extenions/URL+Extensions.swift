//
//  URL+Extensions.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 21/04/2023.
//

import Foundation

extension URL {
    func appendingQueryItem(name: String, value: String?) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        let queryItems = [URLQueryItem(name: name, value: value)] + components?.queryItems
        
        components?.queryItems = queryItems
        
        return components!.url!
    }
}
