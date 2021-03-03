//
//  RegistrationPresenter.swift
//  ExampleMVP
//
//  Created by EgorErmin on 03.03.2021.
//

protocol RegistrationDelegate: class {
    func successRegistration()
}

final class RegistrationPresenter {
    
    // MARK: - Stored properties
    private let view: RegistrationView
    private weak var delegate: RegistrationDelegate?
    
    // MARK: - Initializer
    init(view: RegistrationView,
         delegate: RegistrationDelegate?) {
        self.view = view
        self.delegate = delegate
    }
    
    // MARK: - Methods
    func passwordSwitchChanged(state: Bool) {
        view.setPasswordSecurityMode(isSecure: !state)
    }
    
    func registrationButtonTapped(login: String, password: String, repeatedPassword: String) {
        if login.count > 4,
           login.count < 17,
           password.count > 3,
           password == repeatedPassword {
            DBManager.shared.setUser(login: login, password: password)
            delegate?.successRegistration()
        }
    }
    
}
