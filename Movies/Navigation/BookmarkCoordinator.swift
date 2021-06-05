//
//  BookmarkCoordinator.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit

final class BookmarkCoordinator {
    
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
        let viewController = screens.createBookmarkViewController()
        presenter.viewControllers = [viewController]
    }
}
