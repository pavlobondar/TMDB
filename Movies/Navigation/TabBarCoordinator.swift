//
//  TabBarCoordinator.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit

enum ViewControllerItem: Int {
    case list = 0
    case favourites = 1
}

protocol TabBarSourceType {
    var items: [UINavigationController] { get set }
}

final class TabBarSource: TabBarSourceType {
    
    var items: [UINavigationController] = [
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil)
    ]
    
    init() {
        // MARK: - setup Movies Item
        let movieIcon = UIImage(systemName: "chart.bar.doc.horizontal")
        let filledMovieIcon = UIImage(systemName: "chart.bar.doc.horizontal.fill")
        self[.list].tabBarItem = UITabBarItem(title: "List", image: movieIcon, selectedImage: filledMovieIcon)
        
        // MARK: - Bookmark
        let bookmarkIcon = UIImage(systemName: "suit.heart")
        let filledBookmarkIcon = UIImage(systemName: "suit.heart.fill")
        self[.favourites].tabBarItem = UITabBarItem(title: "Favourites", image: bookmarkIcon, selectedImage: filledBookmarkIcon)
    }
}

extension TabBarSourceType {
    subscript(item: ViewControllerItem) -> UINavigationController {
        get {
            guard !items.isEmpty, item.rawValue < items.count, item.rawValue >= 0 else {
                fatalError("Item does not exist!")
            }
            return items[item.rawValue]
        }
    }
}
