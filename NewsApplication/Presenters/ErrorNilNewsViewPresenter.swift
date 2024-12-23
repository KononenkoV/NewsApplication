//
//  NewsFeedViewPresenter.swift
//  NewsApplication
//
//  Created by Вадим Кононенко on 11.12.2024.
//


import Foundation

protocol ErrorNilNewsPresenterProtocol: AnyObject {
    var newsFeed: [NewsArticle] {get set}
    func sendRequest()
}

class ErrorNilNewsPresenter: ErrorNilNewsPresenterProtocol {
    weak var view: ErrorNilNewsViewControllerProtocol?
    
    private let vkNetworkManager = NetworkManager.shared
    
    var newsFeed: [NewsArticle] = []
    
    init(view: ErrorNilNewsViewControllerProtocol?) {
        self.view = view
    }
    
    func sendRequest(){
                Task {
            do {
                // Параметры для запроса
                let searchQuery = "*" // Пустая строка для всех новостей
                let date = "2024-12-18" // Укажите текущую дату в нужном формате
                let sortedBy = "publishedAt" // Сортировка по умолчанию

                // Вызов функции
                let response = try await vkNetworkManager.getNews(searchQuery: searchQuery, date: date, sortedBy: sortedBy)
                // Обработка ответа
                print("Ответ получен: \(response)")
                
                newsFeed = response.articles
                print("Ответ получен: \(newsFeed.count)")
                
                await self.view?.tableView.reloadData()
                
                
            } catch {
                // Обработка ошибок
                print("Ошибка при выполнении запроса: \(error)")
            }
        }
    }
}

