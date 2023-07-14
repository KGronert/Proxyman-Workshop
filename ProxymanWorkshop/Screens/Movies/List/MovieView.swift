//
//  MovieView.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 04/05/2023.
//

import SwiftUI

struct MoviewView: View {
    let movie: Movie
    let posterURL: URL?
    
    var body: some View {
        HStack {
            AsyncImage(url: posterURL) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(5.0)
            .frame(width: 60, height: 60)
            .clipShape(Rectangle())
            Text(movie.title)
            Spacer()
        }
    }
}
