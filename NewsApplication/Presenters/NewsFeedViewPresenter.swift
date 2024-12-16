//
//  NewsFeedViewPresenter.swift
//  NewsApplication
//
//  Created by Вадим Кононенко on 11.12.2024.
//


import Foundation

protocol NewsFeedViewPresenterProtocol: AnyObject {
    
}

class NewsFeedViewPresenter: NewsFeedViewPresenterProtocol {
    weak var view: NewsFeedViewControllerProtocol?
    
    init(view: NewsFeedViewControllerProtocol?) {
        self.view = view
    }
}

