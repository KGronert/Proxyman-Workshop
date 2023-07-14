//
//  ImageRequest.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 21/04/2023.
//

import Foundation

struct ImageRequest: Request {
    private let configurationProvider: ConfigurationProvider = resolve()
    
    let method: HTTPMethod
    let url: URL
    let queryItems: [URLQueryItem]?
    
    init(input: Self.Input) {
        method = .get
        url = configurationProvider.configuration.imageURL
            .appendingPathComponent(input.posterPath)
        queryItems = nil
    }
}

extension ImageRequest {
    struct Input {
        let posterPath: String
    }
}
