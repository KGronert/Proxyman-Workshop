//
//  Request.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 29/04/2023.
//

import Foundation

protocol Request {
    var method: HTTPMethod { get }
    var url: URL { get }
    var queryItems: [URLQueryItem]? { get }
}
