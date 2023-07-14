//
//  Movie.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 21/04/2023.
//

import Foundation

struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalResults: Int
}

struct Movie: Codable, Identifiable {
    let posterPath: String?
    let overview: String
    let releaseDate: String
    let id: Int
    let title: String
    let voteAverage: Double
}
