//
//  MoviesListModel.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import Foundation

struct MoviesListViewModel {
    var movies: Observable<[MovieTableViewCellViewModel]> = Observable([])
    
    func getImagePath(path: String) -> String {
        "https://image.tmdb.org/t/p/w500\(path)"
    }
    
    func fetchMovies(completion : @escaping (Movie) -> ()) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/movie/top_rated"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: "389e1457e30fd1328b41bb9ee9f2a93b"),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1")
        ]
        let apiService = APIService()
        apiService.fetchData(url: components.url) { (result: Movie?) in
            if let result = result {
                completion(result)
            }
        }
    }
}

struct MovieTableViewCellViewModel {
    let movie: MovieResult
}
