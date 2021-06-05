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
    func createMovieViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(identifier: "ListViewController") as! ListViewController
        return viewController
    }
    
    func createBookmarkViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(identifier: "FavouritesViewController") as! FavouritesViewController
        return viewController
    }
}
