//
//  VKAuthController.swift
//  NewsAppVk
//
//  Created by Олег Дмитриев on 18.12.2024.
//

import Foundation
import UIKit
@preconcurrency import WebKit

class VKAuthController: UIViewController {
    
    var webView: WKWebView!
    var preloadedWebView: WKWebView?
    var delegate: SceneRouteDelegate?
    
    let network = NetworkManager.shared
    let storage = StorageManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
        // Инициализация WKWebView
        if let webView = preloadedWebView {
            webView.frame = view.bounds
            webView.navigationDelegate = self
            view.addSubview(webView)
            self.webView = webView
        } else {
            print("webView не загружен")
        }
    }
    
    deinit {
        print("Объект webView уничтожен из памяти")
        webView = nil
    }
}

extension VKAuthController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else{
            decisionHandler(.allow)
            return
        }
        
        guard let params = network.separatedURLByComponents(from: fragment),
              !params.isEmpty else { return }
        
        if let token = params["access_token"] {
            
            self.delegate?.setLoginStatus(isLogin: true)
            self.storage.token = token
            print("Token = \(token)")
        }
        
        decisionHandler(.cancel)
    }
}
