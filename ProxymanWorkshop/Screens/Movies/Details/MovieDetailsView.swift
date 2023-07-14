//
//  MovieDetailsView.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 04/05/2023.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    let posterURL: URL?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: posterURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                Text(movie.title)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                Text(movie.releaseDate)
                    .font(.subheadline)
                Text("Rating: \(String(format: "%.1f", movie.voteAverage))/10")
                    .font(.subheadline)
                Text(movie.overview)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }
            .padding(.all, 16.0)
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
