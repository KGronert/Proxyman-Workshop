//
//  MoviesListViewModel.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 04/05/2023.
//

import Foundation

@MainActor
final class MoviesListViewModel: NSObject, ObservableObject {
    private let repository: Repository = resolve()
    private let requestFactory: RequestFactory = resolve()

    @Published private(set) var state = ViewState<[Movie]>.idle
    
    func fetchMovies() async {
        state = .loading

        let input = MoviesListRequest.Input(page: 1)
        let result = await repository.moviesList(input: input)
        
        switch result {
        case let .success(response):
            self.state = .content(response.results)
        case let .failure(error):
            self.state = .error(error)
        }
    }
    
    func posterURL(movie: Movie) -> URL? {
        guard let posterPath = movie.posterPath else { return nil }
        
        let input = ImageRequest.Input(posterPath: posterPath)
        let request = ImageRequest(input: input)
        
        return requestFactory.create(request).url
    }
}
