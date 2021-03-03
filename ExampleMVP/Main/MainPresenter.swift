//
//  MainPresenter.swift
//  ExampleMVP
//
//  Created by EgorErmin on 03.03.2021.
//

protocol MainDelegate: class {
    
}

final class MainPresenter {
    
    // MARK: - Stored properties
    private let view: MainView
    private weak var delegate: MainDelegate?
    
    // MARK: - Initializer
    init(view: MainView,
         delegate: MainDelegate?) {
        self.view = view
        self.delegate = delegate
    }
    
    // MARK: - Methods
    
}
