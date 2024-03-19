//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Влад Руденко on 12.03.2024.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - Data Transfer Properties
    let textFieldEmpty = ""

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        addElementsOnScreen()
        doConstrainsTextField()
        doContrainsButtons()
        
        logInButton.addTarget(self, action: #selector(performLogIn), for: .touchUpInside)
        forgotUsernameButton.addTarget(self, action: #selector(showUsernameAlert), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(showPasswordAlert), for: .touchUpInside)
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
    
    var loginTextField: UITextField = {
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
    
    //MARK: - UI Functions
    func addElementsOnScreen() {
        view.addSubview(textFieldsStack)
        view.addSubview(logInButton)
        view.addSubview(forgotButtonsStack)
        textFieldsStack.addArrangedSubview(loginTextField)
        textFieldsStack.addArrangedSubview(passwordTextField)
        forgotButtonsStack.addArrangedSubview(forgotUsernameButton)
        forgotButtonsStack.addArrangedSubview(forgotPasswordButton)
    }
    
    func doConstrainsTextField() {
        NSLayoutConstraint.activate([
            textFieldsStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            textFieldsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textFieldsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            textFieldsStack.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func doContrainsButtons() {
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: 5),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            logInButton.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),
            forgotButtonsStack.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 5),
            forgotButtonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            forgotButtonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            forgotButtonsStack.heightAnchor.constraint(equalTo: logInButton.heightAnchor)
        ])
    }
    
    //MARK: - Button Functions
    @objc func performLogIn() {
        let welcomeVC = WelcomeViewController()
        if loginTextField.text == "admin" &&
        passwordTextField.text == "admin" {
            welcomeVC.textForLabel = loginTextField.text ?? "NoNoNo"
            welcomeVC.forCloseScreen = { [weak self] text in
                self?.loginTextField.text = text
                self?.passwordTextField.text = text
            }
            welcomeVC.modalPresentationStyle = .fullScreen
            present(welcomeVC, animated: true, completion: nil)
        } else {
            let alertFailLogin = UIAlertController(title: "Oh No!", message: "Wrong User Name or Password", preferredStyle: .alert)
            let alertFailLoginAction = UIAlertAction(title: "Try Again", style: .default) { action in
                self.passwordTextField.text = ""
            }
            alertFailLogin.addAction(alertFailLoginAction)
            self.present(alertFailLogin, animated: true, completion: nil)
        }
    }
    
    @objc func showUsernameAlert() {
        let alert = UIAlertController(
            title: "Correct Username is:",
            message: "admin",
            preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        })
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showPasswordAlert() {
        let alert = UIAlertController(
            title: "Correct Password is:",
            message: "admin",
            preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        })
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

