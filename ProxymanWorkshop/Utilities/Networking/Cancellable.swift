//
//  Cancellable.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 21/04/2023.
//

import Foundation
import Kingfisher

// sourcery: mockable
/// A protocol indicating that an activity or action supports cancellation.
/// - Note: Calling cancel() frees up any allocated resources. It also stops side effects such as timers, network access, or disk I/O.
protocol Cancellable {
    // Cancel the activity.
    func cancel()
}

extension NetworkTask: Cancellable {}
extension DownloadTask: Cancellable {}
