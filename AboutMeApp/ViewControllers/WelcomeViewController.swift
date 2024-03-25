//
//  UserViewController.swift
//  AboutMeApp
//
//  Created by Влад Руденко on 12.03.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    //MARK: - Data Transfer Properties
    var forCloseScreen: ((String) -> Void)?
    var userName = "test"
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addElementsOnScreen()
        doConstrainsLabel()
        doContrainsButton()
        logoutButton.addTarget(self, action: #selector(comeBack), for: .touchUpInside)
    }
    
    //MARK: - UI Elements
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        return label
    }()
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 60)
        label.textAlignment = .center
        label.text = "👋🏻"
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitle("Log Out", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .clear
        return button
    }()
    
    func entryLabelText(userName: String) {
        userNameLabel.text = "Hello, \(userName)"
    }
    
}

private extension WelcomeViewController {
    //MARK: - UI Functions
    func addElementsOnScreen() {
        [
            userNameLabel,
            greetingLabel,
            logoutButton
        ].forEach { 
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
    }
    
    func doConstrainsLabel() {
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            greetingLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 50),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
    
    func doContrainsButton() {
        NSLayoutConstraint.activate([
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            logoutButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    //MARK: - Button Functions
    @objc func comeBack() {
        forCloseScreen?("")
        self.dismiss(animated: true)
    }
}
