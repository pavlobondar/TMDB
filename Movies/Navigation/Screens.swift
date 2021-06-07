//
//  Screens.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit

final class Screens {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))
}

extension Screens {
    func createMovieViewController(presenter: UINavigationController, screens: Screens) -> UIViewController {
        let viewController = storyboard.instantiateViewController(identifier: "ListViewController") as! ListViewController
        var viewModel = MoviesListViewModel()
        let movieCoordinator = MovieCoordinator(presenter: presenter, screens: screens)
        
        viewModel.movieCoordinator = movieCoordinator
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createBookmarkViewController(presenter: UINavigationController, screens: Screens) -> UIViewController {
        let viewController = storyboard.instantiateViewController(identifier: "FavouritesViewController") as! FavouritesViewController
        var viewModel = FavouritesListViewModel()
        let favouritesCoordinator = BookmarkCoordinator(presenter: presenter, screens: screens)
        viewModel.favouritesCoordinator = favouritesCoordinator
        
        viewController.viewModel = viewModel
        viewController.loadViewIfNeeded()
        return viewController
    }
}
