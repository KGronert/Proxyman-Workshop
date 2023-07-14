//
//  ErrorView.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 13/07/2023.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    var retryAction: (() async -> Void)?

    var body: some View {
        VStack {
            Text("\(error.localizedDescription)")
                .multilineTextAlignment(.center)
                .padding()
            Button("Try again") {
                Task {
                    await retryAction?()
                }
            }
            .padding()
        }
    }

    func onRetry(_ action: @escaping () async -> Void) -> ErrorView {
        var view = self
        view.retryAction = action
        return view
    }
}
