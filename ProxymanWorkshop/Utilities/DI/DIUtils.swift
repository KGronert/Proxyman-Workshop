//
//  DIUtils.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 20/04/2023.
//

import Swinject

/// Register single service.
/// Helpfull in unit tests where we want to register single fake services for given test case.
/// - Parameters:
///   - serviceType: Service to be registerd.
///   - factory: Closure returning instance of wanted service.
func register<T>(_ serviceType: T.Type, factory: @escaping (() -> T)) {
    DI.container.register(serviceType) { _ in factory() }
}


/// Retrieves instance of registered service.
/// - Returns: Instance of service.
/// - Note: When given service type couldn't be found, it is programming error and so this method raises fatalError.
func resolve<T>() -> T {
    guard let resolved = DI.container.resolve(T.self) else { fatalError("Couldn't resolve dependency: \(T.self)") }
    
    return resolved
}
