//
//  DevelopmentConfiguration.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 20/04/2023.
//

import Foundation

struct DevelopmentConfiguration: Configuration {
    var apiKey = "9796a4e98605f576cf2e343e327b59c2"
    var baseURL = URL(string: "https://api.themoviedb.org/3")!
    var imageURL = URL(string: "https://image.tmdb.org/t/p/w500")!
}
