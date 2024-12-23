//
//  NewsFeedViewController.swift
//  NewsApplication
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

protocol NewsFeedViewControllerProtocol: AnyObject{
    var tableView: UITableView {get set}
}

class NewsFeedViewController: UIViewController, NewsFeedViewControllerProtocol  {
    
    var presenter: NewsFeedViewPresenterProtocol!

    // Переменная с результатами поиска
    var searchedMok = [Article]()
    var isSearching = false
   
    lazy var searchBar: UISearchBar = {
        $0.delegate = self
        $0.sizeToFit()
        $0.searchBarStyle = .prominent
        $0.placeholder = "Поиск новости"
        $0.searchTextField.backgroundColor = .white.withAlphaComponent(0.5)
        $0.tintColor = .black.withAlphaComponent(0.5)
        return $0
    }(UISearchBar())
    
     lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        $0.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseId)
        $0.backgroundColor = .clear
           return $0
       }(UITableView(frame:view.frame, style: .plain))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appNewsBg
        title = "Новости"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.titleView = searchBar
        
        view.addSubviews(tableView)

        setupConstraints()
        
//      Обращаюсь к пресентору чтобы соснул новостей
        presenter.sendRequest()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

        ])
    }
}

// Расширение для таблицы
extension NewsFeedViewController: UITableViewDataSource , UITableViewDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        Количество ячеек в таблице в зависимости от того, идет ли поиск
        if isSearching {
             return searchedMok.count
         } else {
             return presenter.newsFeed.count
         }
    }
    
    // Конфигурация ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId, for: indexPath) as! NewsCell

        // Меняем содержимое таблицы если идет поиск
        if isSearching {
            let item = searchedMok[indexPath.row]
            cell.setupView(item: item)
            cell.selectionStyle = .none
        } else {
            let item = presenter.newsFeed[indexPath.row]
            cell.setupView(item: item)
            cell.selectionStyle = .none
        }
        return cell
    }
    
    // При нажатии на ячейку таблицы переход в детальную новости
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        //Через билдер задается экран и его переменные
        let vc = UIBuilder.createDetailView(imageSource: presenter.newsFeed[indexPath.row].urlToImage ?? "", titleText: presenter.newsFeed[indexPath.row].title ?? "Нет заголовка", dateText: presenter.newsFeed[indexPath.row].publishedAt ?? "Дата неизвестна", descrText: presenter.newsFeed[indexPath.row].content ?? "Нет детального текста", linkText: presenter.newsFeed[indexPath.row].url ?? "Нет ссылки")

        navigationController?.pushViewController(vc, animated: false)
    }
    
    // Поиск ищет только по заголовку поле title
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            
        } else if searchText.count > 2 {
            searchedMok = presenter.newsFeed.filter {
                $0.title!.lowercased().contains(searchText.lowercased())
            }
            isSearching = true
        }
        tableView.reloadData()
    }
}

