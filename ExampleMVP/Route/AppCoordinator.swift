//
//  AppCoordinator.swift
//  ExampleMVP
//
//  Created by EgorErmin on 02.03.2021.
//

import UIKit

final class AppCoordinator {

    // MARK: - Properties
    private let window: UIWindow
    private let navigationController: UINavigationController
    private var someCoordinator: Coordinator?
    
    // MARK: - Initializer
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds),
         navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        
        setupWindow()
        setupSomeCoordinator()
    }
    
    // MARK: - Methods
    private func setupWindow() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func setupSomeCoordinator() {
        someCoordinator = BaseCoordinator(navigationController: self.navigationController)
        self.start()
    }
    
}

// MARK: - Coordinator protocol implement
extension AppCoordinator: Coordinator {
    func start() {
        someCoordinator?.start()
    }
}
