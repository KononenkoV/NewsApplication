//
//  UIBuilder.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

class UIBuilder {
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
    static func createAuthView(delegate: SceneDelegateProtocol?) -> UIViewController {
        let view = AuthViewController()
        let presenter = AuthViewPresenter(view: view, delegate: delegate)
        view.presenter = presenter
        return view
    }
    
//  Создание экрана Детальная новости
    static func createDetailView(imageSource: String, titleText: String, dateText: String, descrText: String, linkText: String) -> UIViewController {
        let view = NewsDetailView()
        let presenter = NewsDetailViewPresenter(view: view, imageSource: imageSource, titleText: titleText, dateText: dateText, descrText: descrText, linkText: linkText)
        view.presenter = presenter
        return view
    }
    
}
