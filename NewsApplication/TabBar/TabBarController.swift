//
//  TabBarController.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .appBlack
        self.tabBar.backgroundColor = .appWhite
        self.tabBar.unselectedItemTintColor = .appBlack
        
        setupTabs()
    }
    
    private func setupTabs() {
        let newsVC = self.createNav(with: "Новости", and: UIImage(systemName: "star"), vc: NewsFeedViewController())
        let errNilVC = self.createNav(with: "Error Nil Vk", and: UIImage(named: "vk-logo"), vc: ErrorNilNewsViewController())
        let repoNewsVC = self.createNav(with: "Хранилище", and: UIImage(systemName: "star.fill"), vc: RepositoryNewsViewController())
        
        self.setViewControllers([newsVC, errNilVC, repoNewsVC], animated: false)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = image
        nav.tabBarItem.title = title
        return nav
    }
    
}
