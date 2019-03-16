//
//  TabBarController.swift
//  |<Orders>|
//
//  Created by RAFAEL on 2/26/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: MenuSectionController(), title: "Menu", imageName: "menu"),
            createNavController(viewController: HomeController(), title: "Home", imageName: "home"),
            createNavController(viewController: UIViewController(), title: "Orders", imageName: "orders"),
            createNavController(viewController: ChatController(), title: "Chat", imageName: "chat"),
            createNavController(viewController: UIViewController(), title: "Deliver", imageName: "deliver"),           
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        return navController
    }
}
