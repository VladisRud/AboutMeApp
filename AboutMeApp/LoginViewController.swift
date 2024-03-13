//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Влад Руденко on 12.03.2024.
//

import UIKit

final class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        view.addSubview(textFieldsStack)
        view.addSubview(logInButton)
        view.addSubview(forgotButtonsStack)
        textFieldsStack.addArrangedSubview(loginTextField)
        textFieldsStack.addArrangedSubview(passwordTextField)
        forgotButtonsStack.addArrangedSubview(forgotUsernameButton)
        forgotButtonsStack.addArrangedSubview(forgotPasswordButton)
        doConstrains()
        
        logInButton.addTarget(self, action: #selector(performLogIn), for: .touchUpInside)
    }
    
    //MARK: - UI Elements
    private var textFieldsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private var forgotButtonsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 30
        return stack
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter Login"
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter Password"
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let logInButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = 7
        return button
    }()
    
    let forgotUsernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Forgot User Name?", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Forgot Password?", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    //MARK: - UI Constrains
    func doConstrains() {
        NSLayoutConstraint.activate([
            textFieldsStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            textFieldsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textFieldsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            textFieldsStack.heightAnchor.constraint(equalToConstant: 80),
            
            logInButton.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: 5),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            logInButton.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),
            
            forgotButtonsStack.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 5),
            forgotButtonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            forgotButtonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            forgotButtonsStack.heightAnchor.constraint(equalTo: logInButton.heightAnchor),
            
        ])
    }
    
    
    @objc func performLogIn() {
        var welcomeVC = WelcomeViewController()
        if loginTextField.text == "admin" &&
        passwordTextField.text == "admin" {
            welcomeVC.textForLabel = loginTextField.text ?? "NoNoNo"
            self.show(welcomeVC, sender: self)
//            self.navigationController?.pushViewController(welcomeVC, animated: true)
        } else {
            return
        }
        
    }
    
    
    
}

