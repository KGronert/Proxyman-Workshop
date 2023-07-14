//
//  URLResponse+Extensions.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 22/04/2023.
//

import Foundation

extension URLResponse {
    var asHttpResponse: HTTPURLResponse? {
        self as? HTTPURLResponse
    }
}
