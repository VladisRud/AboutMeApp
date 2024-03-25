//
//  BioViewController.swift
//  AboutMeApp
//
//  Created by Влад Руденко on 24.03.2024.
//

import UIKit

class BioViewController: UIViewController {
    
    var fullName = "test"
    var bioText = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addElementsOnScreen()
        doConstrainsButton()
        doConstrainsLabels()
        fullNameLabel.text = fullName
        bioLabel.text = bioText
        backButton.addTarget(self, action: #selector(closeBio), for: .touchUpInside)
    }
    
    //MARK: - UI Elements
    let backButton: UIButton = {
        let button = UIButton(type: .close)
        return button
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 30)
        label.numberOfLines = 1
        return label
    }()
    
    let bioLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
}

private extension BioViewController {
    //MARK: - UI Functions
    func addElementsOnScreen() {
        [
            backButton,
            fullNameLabel,
            bioLabel
        ].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func doConstrainsButton() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    func doConstrainsLabels() {
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 75),
            bioLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    @objc func closeBio() {
        dismiss(animated: true)
    }
}
