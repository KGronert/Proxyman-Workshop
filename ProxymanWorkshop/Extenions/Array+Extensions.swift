//
//  Array+Extensions.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 21/04/2023.
//

import Foundation

extension [URLQueryItem] {
    static func + (lhs: [URLQueryItem], rhs: [URLQueryItem]?) -> [URLQueryItem] {
        lhs + (rhs ?? [])
    }
}

extension [Movie] {
    static let empty: [Movie] = []
}

