//
//  Untitled.swift
//  NewsApplication
//
//  Created by Вадим Кононенко on 11.12.2024.
//

import Foundation

protocol RepositoryNewsPresenterProtocol: AnyObject {
    
}

class RepositoryNewsViewPresenter: RepositoryNewsPresenterProtocol {
    
    weak var view: RepositoryNewsViewControllerProtocol?
    
    init(view: RepositoryNewsViewControllerProtocol?) {
        self.view = view
    }
    
    
}
