//
//  BookmarkCoordinator.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit

protocol BookmarkCoordinatorProtocol {
    func showDetail(id: Int)
}

final class BookmarkCoordinator: BookmarkCoordinatorProtocol {
    
    private let presenter: UINavigationController
    private let screens: Screens
    
    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screens = screens
    }
    
    func start() {
        showBookmarkViewController()
    }
    
    private func showBookmarkViewController() {
        let viewController = screens.createBookmarkViewController(presenter: presenter, screens: screens)
        presenter.viewControllers = [viewController]
    }
    
    func showDetail(id: Int) {
        let detailVC: FavouritesDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavouritesDetailViewController") as! FavouritesDetailViewController
        detailVC.movieId = id
        presenter.present(detailVC, animated: true)
    }
}
