//
//  SceneDelegate.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit
import WebKit

protocol SceneRouteDelegate: AnyObject {
    func setLoginStatus(isLogin: Bool)
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate, SceneRouteDelegate, WKNavigationDelegate {

    var window: UIWindow?
    
    var isLogin: Bool
    var token: String
    var preloadedWebView: WKWebView?
    
    let network = NetworkManager.shared
    let storage = StorageManager.shared
    
    override init(){
        self.isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        self.token = UserDefaults.standard.string(forKey: "token") ?? ""
        super.init()
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        window.makeKeyAndVisible()
        self.window = window
        // Запуск предзагрузки webView
        preloadWebView()
        
        setLoginStatus(isLogin: isLogin)
    }
    
    // Функция устанвливает рут контроллер у приложения
    private func startRootController(viewController: UIViewController){
        self.window?.rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    // Делегат роутинга, вызывать при авторизации и разлогина
    func setLoginStatus(isLogin: Bool) {
        if isLogin {
            let startController = TabBarController()
            startRootController(viewController: startController)
        } else {
            let startController = AuthViewController()
            startController.delegate = self
            startRootController(viewController: startController)
        }
    }
    
    func preloadWebView() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            var authLinkResponse: URL?
            
            do {
                authLinkResponse = try network.createEndpoint(from: self.storage.authorizationParameters)
                guard let url = authLinkResponse else { return }
                DispatchQueue.main.async {
                    let webView = WKWebView(frame: .zero)
                    webView.navigationDelegate = self
                    let request = URLRequest(url: url)
                    webView.load(request)
                    self.preloadedWebView = webView
                }
            } catch {
                print(error)
            }
        }
    }


}

