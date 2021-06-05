//
//  TabCoordinator.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit

final class TabCoordinator: NSObject {
    
    private let presenter: UIWindow
    private let tabBarController: UITabBarController
    private let screens: Screens
    
    private var movieCoordinator: MovieCoordinator?
    private var bookmarkCoordinator: BookmarkCoordinator?
    
    private var source: TabBarSource = TabBarSource()
    
    init(presenter: UIWindow) {
        self.presenter = presenter
        
        self.screens = Screens()
        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.tabBar.tintColor = .red
        tabBarController.viewControllers = source.items
        tabBarController.selectedViewController = source[.list]
        super.init()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        presenter.rootViewController = tabBarController
        showMovieTab()
        showBookmarkTab()
    }
    
    private func showMovieTab() {
        movieCoordinator = MovieCoordinator(presenter: source[.list], screens: screens)
        movieCoordinator?.start()
    }
    
    private func showBookmarkTab() {
        bookmarkCoordinator = BookmarkCoordinator(presenter: source[.favourites], screens: screens)
        bookmarkCoordinator?.start()
    }
}
