//
//  WelcomeCoordinator.swift
//  PawNergy
//
//  Created by Trong Triet Le on 20/02/2019.
//  Copyright © 2019 Triet Le. All rights reserved.
//

import UIKit

class WelcomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        let welcomeViewController = WelcomeViewController.instantiate()
        navigationController.pushViewController(welcomeViewController, animated: true)
    }
}
