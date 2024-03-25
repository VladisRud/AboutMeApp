//
//  UserViewController.swift
//  AboutMeApp
//
//  Created by Влад Руденко on 19.03.2024.
//

import UIKit

class UserViewController: UIViewController {
    
    //MARK: - Properties
    var userinfo: User = .init(login: "test", password: "test", userData: Person(firstName: "test", secondName: "test", company: "test", department: "test", role: "test", bio: "test", avatar: "person"))
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addElementsOnScreen()
        doConstrainsButton()
        doConstrainsLabelAndImageView()
        doConstrainsStack()
        entryInformation(userInfo: userinfo)
        bioButton.addTarget(self, action: #selector(openBio), for: .touchUpInside)
    }
    
    //MARK: - UI Elements
    let bioButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Bio", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
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
    
    let userImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.fill")
        return image
    }()
    
    private var labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    let firstNameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .italicSystemFont(ofSize: 20)
        label.numberOfLines = 1
        return label
    }()
    
    let secondNameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .italicSystemFont(ofSize: 20)
        label.numberOfLines = 1
        return label
    }()
    
    let companyNameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .italicSystemFont(ofSize: 20)
        label.numberOfLines = 1
        return label
    }()
    
    let departmentNameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .italicSystemFont(ofSize: 20)
        label.numberOfLines = 1
        return label
    }()
    
    let roleNameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .italicSystemFont(ofSize: 20)
        label.numberOfLines = 1
        return label
    }()

}

private extension UserViewController {
    //MARK: - UI functions
    func addElementsOnScreen() {
        [
            bioButton,
            fullNameLabel,
            userImage,
            labelStack
        ].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            firstNameLabel,
            secondNameLabel,
            companyNameLabel,
            departmentNameLabel,
            roleNameLabel
        ].forEach {
            labelStack.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        

    }
    
    func doConstrainsButton() {
        NSLayoutConstraint.activate([
            bioButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            bioButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    func doConstrainsLabelAndImageView() {
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            fullNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImage.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 25),
            userImage.heightAnchor.constraint(equalToConstant: 100),
            userImage.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func doConstrainsStack() {
        NSLayoutConstraint.activate([
            labelStack.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 20),
            labelStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            labelStack.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    //MARK: - Functions
    @objc func openBio() {
        let bioVC = BioViewController()
        bioVC.fullName = "\(userinfo.userData.firstName) \(userinfo.userData.secondName)"
        bioVC.bioText = "\(userinfo.userData.bio)"
        bioVC.modalPresentationStyle = .fullScreen
        present(bioVC, animated: true, completion: nil)
        print(userinfo.userData.bio)
    }
    
    func entryInformation(userInfo: User) {
        fullNameLabel.text = "\(userInfo.userData.firstName) \(userInfo.userData.secondName)".uppercased()
        firstNameLabel.text = "First Name: \(userInfo.userData.firstName)"
        secondNameLabel.text = "Second Name: \(userInfo.userData.secondName)"
        companyNameLabel.text = "Company: \(userInfo.userData.company)"
        departmentNameLabel.text = "Department: \(userInfo.userData.department)"
        roleNameLabel.text = "Role: \(userInfo.userData.role)"
        userImage.image = UIImage(systemName: userInfo.userData.avatar)
    }
}
