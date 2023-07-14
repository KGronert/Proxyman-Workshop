//
//  BundleWrapper.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 22/04/2023.
//

import Foundation

// sourcery: mockable
/// Abstraction for system `Bundle`.
protocol BundleWrapper {
    /// Returns the value associated with the specified key in the receiver's information property list.
    /// - Parameters:
    ///   - key: A key in the receiver's property list.
    /// - Returns: The value associated with key in the receiver's property list (Info.plist). The localized value of a key is returned when one is available.
    func object(forInfoDictionaryKey key: String) -> Any?
}

extension Bundle: BundleWrapper { }
