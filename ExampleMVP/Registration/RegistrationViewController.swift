//
//  RegistrationViewController.swift
//  ExampleMVP
//
//  Created by EgorErmin on 03.03.2021.
//

import UIKit
import SnapKit

protocol RegistrationView {
    func setPasswordSecurityMode(isSecure: Bool)
}

final class RegistrationViewController: UIViewController {
    
    // MARK: - Stored properties
    var presenter: RegistrationPresenter?
    
    // MARK: - Computed properties
    lazy var mainView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login:"
        label.font = UIFont(name: "Arial", size: 17)
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont(name: "Arial", size: 17)
        return label
    }()
    
    lazy var repeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat password"
        label.font = UIFont(name: "Arial", size: 17)
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Arial", size: 15)
        textField.placeholder = "Input your login"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.font = UIFont(name: "Arial", size: 15)
        textField.placeholder = "Input your password"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    lazy var repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.font = UIFont(name: "Arial", size: 15)
        textField.placeholder = "Repeat your password"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    lazy var showPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Show password?"
        label.font = UIFont(name: "Arial", size: 15)
        return label
    }()
    
    lazy var showPasswordSwitch: UISwitch = {
        let passwordSwitch = UISwitch()
        passwordSwitch.addTarget(self, action: #selector(changePasswordSwitch), for: .touchUpInside)
        return passwordSwitch
    }()
    
    lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Registration", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(registration), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    private func setupUI() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        self.title = "Registration"
        self.view.backgroundColor = .white
        self.view.addSubview(mainView)
        self.view.addSubview(registrationButton)
        
        mainView.addSubview(loginLabel)
        mainView.addSubview(passwordLabel)
        mainView.addSubview(loginTextField)
        mainView.addSubview(passwordTextField)
        mainView.addSubview(repeatPasswordLabel)
        mainView.addSubview(repeatPasswordTextField)
        mainView.addSubview(showPasswordLabel)
        mainView.addSubview(showPasswordSwitch)
        
        mainView.snp.makeConstraints({
            $0.centerX.centerY.equalToSuperview()
            $0.left.right.equalToSuperview().inset(16)
        })
        
        registrationButton.snp.makeConstraints({
            $0.top.equalTo(mainView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(mainView.snp.width)
        })
        
        loginLabel.snp.makeConstraints({
            $0.top.left.equalToSuperview().inset(16)
        })
        
        loginTextField.snp.makeConstraints({
            $0.top.equalTo(loginLabel.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(16)
        })
        
        passwordLabel.snp.makeConstraints({
            $0.top.equalTo(loginTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        })
        
        passwordTextField.snp.makeConstraints({
            $0.top.equalTo(passwordLabel.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(16)
        })
        
        repeatPasswordLabel.snp.makeConstraints({
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        })
        
        repeatPasswordTextField.snp.makeConstraints({
            $0.top.equalTo(repeatPasswordLabel.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(16)
        })
        
        showPasswordSwitch.snp.makeConstraints({
            $0.top.equalTo(repeatPasswordTextField.snp.bottom).offset(16)
            $0.right.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        })
        
        showPasswordLabel.snp.makeConstraints({
            $0.right.equalTo(showPasswordSwitch.snp.left).offset(-8)
            $0.centerY.equalTo(showPasswordSwitch)
        })
    }
    
    @objc private func changePasswordSwitch() {
        presenter?.passwordSwitchChanged(state: showPasswordSwitch.isOn)
    }
    
    @objc private func registration() {
        presenter?.registrationButtonTapped(login: loginTextField.text ?? "",
                                            password: passwordTextField.text ?? "",
                                            repeatedPassword: repeatPasswordTextField.text ?? "")
    }
    
}

// MARK: - RegistrationView protocol implement
extension RegistrationViewController: RegistrationView {
    
    func setPasswordSecurityMode(isSecure: Bool) {
        passwordTextField.isSecureTextEntry = isSecure
        repeatPasswordTextField.isSecureTextEntry = isSecure
    }
    
}
