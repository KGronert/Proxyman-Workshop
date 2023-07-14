//
//  Repository.swift
//  ProxymanWorkshop
//
//  Created by Kamil Gronert on 20/04/2023.
//

// sourcery: mockable
/// The `Repository` protocol defines a set of methods for downloading data from the BE.
protocol Repository {
    /// Downloads a list of movies.
    /// - Returns: Returns a `NetworkResult` containing an array of `Movie` objects if the request was successful, or an error otherwise.
    func moviesList(input: MoviesListRequest.Input) async -> NetworkResult<MovieResponse>
}

final class RepositoryImpl: Repository {
    private let networkingHandler: HTTPHandler = resolve()
    
    func moviesList(input: MoviesListRequest.Input) async -> NetworkResult<MovieResponse> {
        let request = MoviesListRequest(input: input)
        let task: NetworkTask<MovieResponse> = await networkingHandler.make(request)
        
        switch await task.result {
        case let .success(response): return .success(response)
        case let .failure(error): return .failure(error)
        }
    }
}
