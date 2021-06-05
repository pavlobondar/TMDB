//
//  AppCoordinator.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import Foundation

final class AppCoordinator {
    
    private unowned var sceneDelegate: SceneDelegate
    
    private var tabcoordinator: TabCoordinator?
    
    init(sceneDelegate: SceneDelegate) {
        self.sceneDelegate = sceneDelegate
    }
    
    func start() {
        tabcoordinator = TabCoordinator(presenter: sceneDelegate.window!)
        tabcoordinator?.start()
    }
}
