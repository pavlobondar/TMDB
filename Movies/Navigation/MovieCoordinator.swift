//
//  MovieCoordinator.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit

final class MovieCoordinator {
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
        let viewController = screens.createMovieViewController()
        presenter.viewControllers = [viewController]
    }
}
