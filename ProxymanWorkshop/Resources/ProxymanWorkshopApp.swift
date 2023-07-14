//
//  ProxymanWorkshopApp.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 03/05/2023.
//

import SwiftUI

@main
struct ProxymanWorkshopApp: App {
    init() {
        DI.register()
    }

    var body: some Scene {
        WindowGroup {
            MoviesListView()
        }
    }
}
