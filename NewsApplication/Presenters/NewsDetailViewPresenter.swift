//
//  NewsDetailViewPresenter.swift
//  NewsApplication
//
//  Created by Вадим Кононенко on 16.12.2024.
//

import Foundation

protocol NewsDetailViewPresenterProtocol: AnyObject {
    
}

class NewsDetailViewPresenter: NewsDetailViewPresenterProtocol {
    weak var view: NewsDetailViewControllerProtocol?
    
    init(view: NewsDetailViewControllerProtocol?, imageSource: String, titleText: String, dateText: String, descrText: String, linkText: String) {
        self.view = view
        self.view?.imageSource = imageSource
        self.view?.titleText = titleText
        self.view?.dateText = dateText
        self.view?.descrText = descrText
        self.view?.linkText = linkText
    }
    
    
}

