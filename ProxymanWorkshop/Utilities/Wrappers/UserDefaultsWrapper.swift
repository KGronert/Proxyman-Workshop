//
//  UserDefaultsWrapper.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 21/04/2023.
//

import Foundation

// sourcery: mockable
/// Abstraction for system `UserDefaults`.
protocol UserDefaultsWrapper {
    /// Sets the value of the specified default key.
    /// - Parameters:
    ///   - value: The object to store in the defaults database.
    ///   - defaultName: A key in the current user‘s defaults database.
    func set(_ value: Any?, forKey defaultName: String)
    
    /// Returns the Boolean value associated with the specified key.
    /// - Parameters:
    ///   - defaultName: A key in the current user‘s defaults database.
    func bool(forKey defaultName: String) -> Bool
}

extension UserDefaults: UserDefaultsWrapper {}
