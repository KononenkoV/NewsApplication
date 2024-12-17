//
//  NewsFeedViewPresenter.swift
//  NewsApplication
//
//  Created by Вадим Кононенко on 11.12.2024.
//


import Foundation

protocol NewsFeedViewPresenterProtocol: AnyObject {
    var newsFeed: [Article] {get set}
    func sendRequest()
}

class NewsFeedViewPresenter: NewsFeedViewPresenterProtocol {
    weak var view: NewsFeedViewControllerProtocol?
    
    private let newsNetworkManager = NewsNetworkManager()
    
//  Теперь массив новостей тут хранится
    var newsFeed: [Article] = []

    
    init(view: NewsFeedViewControllerProtocol?) {
        self.view = view
    }
    
    func sendRequest(){
        newsNetworkManager.getNews() { [weak self] news in
            self?.newsFeed = news
            self?.view?.tableView.reloadData()
        }
    }
    
    
}

