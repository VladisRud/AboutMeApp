//
//  UserViewController.swift
//  AboutMeApp
//
//  Created by Влад Руденко on 12.03.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    var textForLabel = "Nu Checknem"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        userNameLabel.text = textForLabel
        view.addSubview(userNameLabel)
        doConstrains()
    }
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
//        label.textColor = .systemBlue
        return label
    }()
    
    func doConstrains() {
        NSLayoutConstraint.activate([
            userNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
