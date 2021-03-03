//
//  AuthorizationPresenter.swift
//  ExampleMVP
//
//  Created by EgorErmin on 02.03.2021.
//

protocol AuthorizationDelegate: class {
    func goMain()
    func goRegistration()
}

final class AuthorizationPresenter {
    
    // MARK: - Properties
    private var view: AuthorizationView
    private weak var delegate: AuthorizationDelegate?
    
    // MARK: - Initializer
    init(view: AuthorizationView,
         delegate: AuthorizationDelegate?) {
        self.view = view
        self.delegate = delegate
    }
    
    // MARK: - Methods
    func passwordSwitchChanged(state: Bool) {
        view.setPasswordSecurityMode(isSecure: !state)
    }
    
    func loginButtonTapped(login: String, password: String) {
        if login.count > 4,
           login.count < 17,
           password.count > 3  {
            if DBManager.shared.checkUser(login: login, password: password) {
                delegate?.goMain()
            } else {
                delegate?.goRegistration()
            }
        } else {
            view.removePassword()
        }
    }
    
}
