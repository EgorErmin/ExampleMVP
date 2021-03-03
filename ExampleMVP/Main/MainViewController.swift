//
//  MainViewController.swift
//  ExampleMVP
//
//  Created by EgorErmin on 03.03.2021.
//

import UIKit
import SnapKit

protocol MainView: class {
    
}

final class MainViewController: UIViewController {
    
    // MARK: - Stored properties
    var presenter: MainPresenter?
    
    // MARK: - Computed properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    private func setupUI() {
        self.title = "Main"
        self.view.backgroundColor = .white
    }
    
}

// MARK: - MainView protocol implement
extension MainViewController: MainView { }
