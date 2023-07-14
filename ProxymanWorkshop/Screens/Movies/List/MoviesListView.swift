//
//  MoviesListView.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 04/05/2023.
//

import SwiftUI

struct MoviesListView: View {
    @StateObject private var viewModel = MoviesListViewModel()
    
    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .idle:
              idleView()
            case .loading:
              loadingView()
            case let .content(transactions):
              contentView(transactions)
            case let .error(error):
              errorView(error)
            }
        }
        .background(Color(UIColor.systemBackground))
    }

    private func idleView() -> some View {
      Text("No content")
        .task {
            await viewModel.fetchMovies()
        }
    }

    private func loadingView() -> some View {
      ProgressView("Fetching list")
    }

    private func contentView(_ movies: [Movie]) -> some View {
        List {
            ForEach(movies) { movie in
                let posterURL = viewModel.posterURL(movie: movie)

                NavigationLink(destination: MovieDetailsView(movie: movie, posterURL: posterURL)) {
                    MoviewView(movie: movie, posterURL: posterURL)
                }
            }
        }
        .refreshable {
            Task {
                await viewModel.fetchMovies()
            }
        }
        .listStyle(PlainListStyle())
        .padding(.top, 16.0)
        .navigationTitle("List")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func errorView(_ error: Error) -> some View {
      ErrorView(error: error)
        .onRetry {
          await viewModel.fetchMovies()
        }
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}
