//
//  MoviesListRequest.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 22/04/2023.
//

import Foundation

struct MoviesListRequest: Request {
    private let configurationProvider: ConfigurationProvider = resolve()
    
    let method: HTTPMethod
    let url: URL
    let queryItems: [URLQueryItem]?
    
    init(input: Self.Input) {
        method = .get
        url = configurationProvider.configuration.baseURL
            .appendingPathComponent(API.endpoint)
        queryItems = [
            URLQueryItem(name: API.apiKey, value: configurationProvider.configuration.apiKey),
            URLQueryItem(name: API.page, value: input.page.stringify)
        ]
    }
    
    private enum API {
        static let endpoint = "movie/now_playing"
        static let apiKey = "api_key"
        static let page = "page"
    }
}

extension MoviesListRequest {
    struct Input {
        let page: Int
    }
}
