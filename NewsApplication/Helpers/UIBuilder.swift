//
//  UIBuilder.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

final class UIBuilder {
    
    let offsetPage: CGFloat = 20
    
//  Создание экрана News
    static func createNewsView() -> UIViewController {
        let view = NewsFeedViewController()
        let presenter = NewsFeedViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
//  Создание экрана News VK
    static func createNewsVKView() -> UIViewController {
        let view = ErrorNilNewsViewController()
        let presenter = ErrorNilNewsPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
//  Создание экрана Repository
    static func createRepoView() -> UIViewController {
        let view = RepositoryNewsViewController()
        let presenter = RepositoryNewsViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
//  Создание экрана Авторизация
//    static func createAuthView(delegate: SceneDelegateProtocol?) -> UIViewController {
//        let view = AuthViewController()
//        let presenter = AuthViewPresenter(view: view, delegate: delegate)
//        view.presenter = presenter
//        return view
//    }
    
//  Создание экрана Детальная новости
    static func createDetailView(imageSource: String, titleText: String, dateText: String, descrText: String, linkText: String) -> UIViewController {
        let view = NewsDetailView()
        let presenter = NewsDetailViewPresenter(view: view, imageSource: imageSource, titleText: titleText, dateText: dateText, descrText: descrText, linkText: linkText)
        view.presenter = presenter
        return view
    }
    
    func appThumbnail(img: String, brs: CGFloat = 20) -> UIImageView {
        let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.image = UIImage(named: img)
        picture.contentMode = .scaleAspectFill
        picture.clipsToBounds = true
        picture.layer.cornerRadius = brs
        
        return picture
    }

    func addLabel(text: String, fontS: CGFloat, fontW: UIFont.Weight, lines: Int = 0, color: UIColor = .appBlack) -> UILabel {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.text = text
        txt.font = .systemFont(ofSize: fontS, weight: fontW)
        txt.numberOfLines = lines
        txt.textColor = color
        
        return txt
    }
    
    func addButton(text: String, offsetH: CGFloat = 60, bgc: UIColor = .appBlack, brs: CGFloat = 30) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: offsetH).isActive = true
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(.appWhite, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = bgc
        btn.layer.cornerRadius = brs
        return btn
    }
    
}
