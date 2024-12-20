//
//  AuthViewController.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//
import UIKit
import WebKit

protocol WebViewPreloadable: AnyObject{
    var preloadedWebView: WKWebView? { get set }
}

class AuthViewController: UIViewController, WebViewPreloadable, WKNavigationDelegate {
    
    var delegate: SceneRouteDelegate?
    
    let network = NetworkManager.shared
    let storage = StorageManager.shared
    
    private let builder = UIBuilder()
    
    var preloadedWebView: WKWebView?
    
    lazy var addThumbnail: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "thumbnail-01")
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    lazy var addTitle: UILabel = builder.addLabel(text: "Error Nil",
                                                  fontS: 30, fontW: .bold, color: .appWhite)
    lazy var addSubTitle: UILabel = builder.addLabel(text: "Team: Oleg, Vadim, Islam",
                                                    fontS: 16, fontW: .regular, color: .appWhite)
    lazy var addButtonAuth: UIButton = builder.addButton(text: "Войти")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addButtonAuth.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupUI()
        setupConstraints()
        setupHandlers()
    }
    
    func preloadWebView() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            var authLinkResponse: URL?
            
            do {
                authLinkResponse = try self.network.createEndpoint(from: self.storage.authorizationParameters)
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
    
    private func setupUI() {
        view.backgroundColor = .systemCyan

        view.addSubviews(addThumbnail, addTitle, addSubTitle, addButtonAuth)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            addThumbnail.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            addThumbnail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            addThumbnail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            addThumbnail.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            addTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            addTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(self.builder.offsetPage)),
            addTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: self.builder.offsetPage),
            
            addSubTitle.topAnchor.constraint(equalTo: addTitle.bottomAnchor, constant: 6),
            addSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(self.builder.offsetPage)),
            addSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: self.builder.offsetPage),
            
            addButtonAuth.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            addButtonAuth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(self.builder.offsetPage)),
            addButtonAuth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: self.builder.offsetPage),
        ])
    }
    
    // MARK: - Handler to Tab Bar VC
    private func setupHandlers() {
        addButtonAuth.addTarget(self, action: #selector(signApp), for: .primaryActionTriggered)
    }
    
    @objc func signApp() {
        addButtonAuth.isEnabled = false
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            preloadedWebView = sceneDelegate.preloadedWebView
            
            let loadingIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
            loadingIndicator.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
            loadingIndicator.startAnimating()
            
            let loadingBarItem = UIBarButtonItem(customView: loadingIndicator)
            navigationItem.rightBarButtonItem = loadingBarItem
            
            let vkAuthController = VKAuthController()
            vkAuthController.delegate = delegate
            vkAuthController.preloadedWebView = self.preloadedWebView
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                loadingIndicator.stopAnimating()
                loadingIndicator.removeFromSuperview()
                self.navigationController?.pushViewController(vkAuthController, animated: true)
            }
        }
    }
    
}
