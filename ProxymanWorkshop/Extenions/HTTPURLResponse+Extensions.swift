//
//  HTTPURLResponse+Extensions.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 22/04/2023.
//

import Foundation

extension HTTPURLResponse {
    var isSuccess: Bool {
        200...299 ~= statusCode
    }
}
