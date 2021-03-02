//
//  AuthorizationPresenter.swift
//  ExampleMVP
//
//  Created by EgorErmin on 02.03.2021.
//

protocol AuthorizationDelegate: class {
    func login()
}

final class AuthorizationPresenter {
    
    // MARK: - Properties
    private var view: AuthorizationView
    private weak var delegate: AuthorizationDelegate?
    
    init(view: AuthorizationView,
         delegate: AuthorizationDelegate) {
        self.view = view
        self.delegate = delegate
    }
    
    func passwordSwitchChanged() {
        
    }
    
    func loginButtonTapped() {
        delegate?.login()
    }
    
}
