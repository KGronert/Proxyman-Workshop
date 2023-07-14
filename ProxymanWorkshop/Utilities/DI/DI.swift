//
//  DI.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 20/04/2023.
//

import Foundation
import Swinject

/// Class used as a wrapper for dependency container.
final class DI {
    static let container = Container()
    
    /// Method for registering all of the used components.
    static func register() {
        container.register(RequestFactory.self) { _ in RequestFactoryImpl() }
        container.register(URLSessionWrapper.self) { _ in URLSession(configuration: .default) }.inObjectScope(.container)
        container.register(HTTPHandler.self) { _ in HTTPHandlerImpl() }
        container.register(ConfigurationProvider.self) { _ in ConfigurationProviderImpl() }.inObjectScope(.container)
        container.register(Repository.self) { _ in RepositoryImpl() }.inObjectScope(.container)
        container.register(UserDefaultsWrapper.self) { _ in UserDefaults.standard }.inObjectScope(.container)
        container.register(BundleWrapper.self) { _ in Bundle.main }.inObjectScope(.container)
    }
}
