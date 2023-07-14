//
//  Configuration.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 20/04/2023.
//

import Foundation

// sourcery: mockable
/// Provides necessary information specific to the envirnoment of the Application.
protocol Configuration {
    var apiKey: String { get }
    var baseURL: URL { get }
    var imageURL: URL { get }
}
