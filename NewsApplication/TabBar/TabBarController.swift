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
        
        self.tabBar.tintColor = .red
        self.tabBar.backgroundColor = .appWhite
        self.tabBar.unselectedItemTintColor = .appGrayText
        
        setupTabs()
    }
    
    private func setupTabs() {
        let newsVC = self.createNav(title: "Новости", image: UIImage(systemName: "folder"), selectedImage: UIImage(systemName: "folder.fill"), vc: UIBuilder.createNewsView())
        let errNilVC = self.createNav(title: "Error Nil Vk", image: UIImage(named: "vk-logo"), selectedImage: UIImage(named: "vk-logo"), vc: UIBuilder.createNewsVKView())
        let repoNewsVC = self.createNav(title: "Хранилище",  image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"), vc: UIBuilder.createRepoView())
        

        self.setViewControllers([newsVC, errNilVC, repoNewsVC], animated: true)
    }
    
    private func createNav(title: String, image: UIImage?, selectedImage: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = image
        nav.tabBarItem.selectedImage = selectedImage
        nav.tabBarItem.title = title
        return nav
    }
    
}
