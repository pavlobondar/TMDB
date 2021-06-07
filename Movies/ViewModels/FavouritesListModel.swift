//
//  FavouritesListModel.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import Foundation

struct FavouritesListViewModel {
    var movieDetail: Observable<FavouritesTableViewCellViewModel> = Observable(nil)
    var favouritesCoordinator: BookmarkCoordinatorProtocol!
    var movieFavorites: [MovieTableViewCellViewModel] = []
    var title = "Favourites"
    
    func fetchMovies(movieId: Int, completion : @escaping (MovieDetail) -> ()) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/movie/\(movieId)"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: "389e1457e30fd1328b41bb9ee9f2a93b"),
            URLQueryItem(name: "language", value: "en-US")
        ]
        
        let apiService = APIService()
        apiService.fetchData(url: components.url) { (result: MovieDetail?) in
            if let result = result {
                completion(result)
            }
        }
    }
    
    func showDetail(indexPath: IndexPath) {
        let id = movieFavorites[indexPath.row].movie.id
        guard let id = id else { return }
        favouritesCoordinator.showDetail(id: id)
    }
}

struct FavouritesTableViewCellViewModel {
    let movieDetail: MovieDetail
}
