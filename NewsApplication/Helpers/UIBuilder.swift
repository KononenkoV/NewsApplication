//
//  UIBuilder.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

class UIBuilder {
//  News
    static func createNewsView() -> UIViewController {
        let view = NewsFeedViewController()
        let presenter = NewsFeedViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
//  News VK
    static func createNewsVKView() -> UIViewController {
        let view = ErrorNilNewsViewController()
        let presenter = ErrorNilNewsPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
//  Repository
    static func createRepoView() -> UIViewController {
        let view = RepositoryNewsViewController()
        let presenter = RepositoryNewsViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
//    Авторизация
    
//    Детальная новости
    
    
}
