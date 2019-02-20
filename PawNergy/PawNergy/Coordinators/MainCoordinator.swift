//
//  MainCoordinator.swift
//  PawNergy
//
//  Created by Trong Triet Le on 20/02/2019.
//  Copyright © 2019 Triet Le. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        showWelcome()
    }
    
    func showWelcome() {
        let welcomeChild = WelcomeCoordinator(navigationController: navigationController)
        welcomeChild.parentCoordinator = self
        childCoordinators.append(welcomeChild)
        welcomeChild.start()
    }
    
    func removeChild(for child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {return}
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let welcomeViewController = fromViewController as? WelcomeViewController {
            removeChild(for: welcomeViewController.welcomeCoordinator)
        }
    }
}
