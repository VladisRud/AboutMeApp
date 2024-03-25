//
//  AboutMeTabBarController.swift
//  AboutMeApp
//
//  Created by Влад Руденко on 19.03.2024.
//

import UIKit

class AboutMeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let welcomeVC = WelcomeViewController()
        let userVC = UserViewController()
        
        welcomeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), selectedImage: nil)
        
        userVC.tabBarItem = UITabBarItem(title: "User", image: UIImage(systemName: "person.fill"), selectedImage: nil)
        
        viewControllers = [welcomeVC, userVC]
    }

}
