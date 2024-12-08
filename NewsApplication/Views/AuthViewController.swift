//
//  AuthViewController.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

class AuthViewController: UIViewController {
    
    var delegate: SceneDelegateProtocol?
    
    lazy var thumbnail: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "thumbnail-01")
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    lazy var welcomeTitle: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Error Nil"
        $0.font = .systemFont(ofSize: 30, weight: .semibold)
        $0.textColor = .appWhite
        return $0
    }(UILabel())
    
    lazy var welcomeSubtitle: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Святой ёжик team"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .appWhite
        return $0
    }(UILabel())
    
    lazy var welcomeButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 58).isActive = true
        $0.setTitle("Войти", for: .normal)
        $0.setTitleColor(.appWhite, for: .normal)
        $0.backgroundColor = .appBlack
        $0.layer.cornerRadius = 30
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        view.addSubviews(thumbnail, welcomeTitle, welcomeSubtitle, welcomeButton)
        
        // MARK: - Handler to Tab Bar VC
        welcomeButton.addTarget(self, action: #selector(signApp), for: .primaryActionTriggered)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            thumbnail.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            thumbnail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            thumbnail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            thumbnail.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            welcomeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            welcomeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            welcomeSubtitle.topAnchor.constraint(equalTo: welcomeTitle.bottomAnchor, constant: 6),
            welcomeSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            welcomeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            welcomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
        ])
    }
    
    
    @objc func signApp(sender: UITapGestureRecognizer) {
        self.delegate?.changeRootVC()
    }
    
    func showLoginSuccess() {
        print("showLoginSuccess")
    }
    
    func showLoginError(message: String) {
        print("showLoginError")
    }
    
}
