//
//  BaseCoordinator.swift
//  ExampleMVP
//
//  Created by EgorErmin on 02.03.2021.
//

import UIKit

final class BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private func showAuthorization() {
        let authorizationVC = AuthorizationViewController()
        let presenter = AuthorizationPresenter(view: authorizationVC, delegate: self)
        authorizationVC.presenter = presenter
        authorizationVC.title = "Login"
        navigationController.viewControllers = [authorizationVC]
    }
    
    private func showRegistration() {
        
    }
    
    private func showMain() {
        
    }
    
}

extension BaseCoordinator: AuthorizationDelegate {
    func login() {
        showMain()
    }
}

extension BaseCoordinator: Coordinator {
    
    func start() {
        showAuthorization()
    }
    
}
