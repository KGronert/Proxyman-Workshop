//
//  ConfigurationProvider.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 20/04/2023.
//

import Foundation

// sourcery: mockable
/// Responsible for providing current `Configuration` of the Application.
protocol ConfigurationProvider {
    var configuration: Configuration { get }
}

enum ConfigurationType: String {
    case production = "Production"
    case development = "Development"
}

class ConfigurationProviderImpl: ConfigurationProvider {
    private let bundle: BundleWrapper = resolve()
    
    var configuration: Configuration {
        guard let configurationName = bundle.object(forInfoDictionaryKey: "Configuration") as? String else { fatalError("Couldn't determine configuration") }
        guard let configurationType = ConfigurationType(rawValue: configurationName) else { fatalError("Couldn't determine configuration") }
        
        switch configurationType {
        case .production: return ProductionConfiguration()
        case .development: return DevelopmentConfiguration()
        }
    }
}
