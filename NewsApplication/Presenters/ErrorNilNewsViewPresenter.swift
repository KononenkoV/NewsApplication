//
//  NewsFeedViewPresenter.swift
//  NewsApplication
//
//  Created by Вадим Кононенко on 11.12.2024.
//


import Foundation

protocol ErrorNilNewsPresenterProtocol: AnyObject {
    
}

class ErrorNilNewsPresenter: ErrorNilNewsPresenterProtocol {
    weak var view: ErrorNilNewsViewControllerProtocol?
    
    init(view: ErrorNilNewsViewControllerProtocol?) {
        self.view = view
    }
    
    
}

