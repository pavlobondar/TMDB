//
//  MovieCoordinator.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit

protocol MovieCoordinatorProtocol {
    func showDetail(movie: MovieResult?)
}

final class MovieCoordinator: MovieCoordinatorProtocol {
    private let presenter: UINavigationController
    private let screens: Screens
    
    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screens = screens
    }
    
    func start() {
        showMovieViewController()
    }
    
    private func showMovieViewController() {
        let viewController = screens.createMovieViewController(presenter: presenter, screens: screens)
        presenter.viewControllers = [viewController]
    }
    
    func showDetail(movie: MovieResult?) {
        let detailVC: MovieDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        detailVC.movie = movie
        presenter.present(detailVC, animated: true)
    }
}
