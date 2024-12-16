//
//  SceneDelegate.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

protocol SceneDelegateProtocol {
    func changeRootVC()
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate, SceneDelegateProtocol, UITabBarControllerDelegate {

    var window: UIWindow?
    
    func changeRootVC() {
        self.window?.rootViewController = TabBarController()
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        
//        let authVC = AuthViewController()
        let authVC = UIBuilder.createAuthView(delegate: self)
        
        
        self.window = UIWindow(windowScene: sceneWindow)
        
//       !!! Вот сюда билдер тоже надо приделать  !!!
        self.window?.rootViewController = authVC
        self.window?.makeKeyAndVisible()
    }


}

