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
        navigationController.viewControllers = [authorizationVC]
    }
    
    private func showRegistration() {
        let registrationVC = RegistrationViewController()
        let presenter = RegistrationPresenter(view: registrationVC, delegate: self)
        registrationVC.presenter = presenter
        navigationController.pushViewController(registrationVC, animated: true)
    }
    
    private func showMain() {
        let mainVC = MainViewController()
        let presenter = MainPresenter(view: mainVC, delegate: nil)
        mainVC.presenter = presenter
        navigationController.pushViewController(mainVC, animated: true)
    }
    
}


// MARK: - AuthorizationDelegate protocol implement
extension BaseCoordinator: AuthorizationDelegate {
    
    func goMain() {
        showMain()
    }
    
    func goRegistration() {
        showRegistration()
    }
    
}

// MARK: - AuthorizationDelegate protocol implement
extension BaseCoordinator: RegistrationDelegate {
    
    func successRegistration() {
        showMain()
    }
    
}

// MARK: - Coordinator protocol implement
extension BaseCoordinator: Coordinator {
    
    func start() {
        showAuthorization()
    }
    
}
