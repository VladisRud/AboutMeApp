//
//  UserViewController.swift
//  AboutMeApp
//
//  Created by Влад Руденко on 12.03.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    //MARK: - Data Transfer Properties
    var textForLabel = ""
    var forCloseScreen: ((String) -> Void)?
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userNameLabel.text = "Hello, \(textForLabel)"
        addElementsOnScreen()
        doConstrainsLabel()
        doContrainsButton()
        logoutButton.addTarget(self, action: #selector(comeBack), for: .touchUpInside)
    }
    
    //MARK: - UI Elements
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        return label
    }()
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 60)
        label.textAlignment = .center
        label.text = "👋🏻"
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitle("Log Out", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .clear
        return button
    }()
    
    //MARK: - UI Functions
    func addElementsOnScreen() {
        view.backgroundColor = .systemBackground
        view.addSubview(userNameLabel)
        view.addSubview(greetingLabel)
        view.addSubview(logoutButton)
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
