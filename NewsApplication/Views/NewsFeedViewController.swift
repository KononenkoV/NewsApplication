//
//  NewsFeedViewController.swift
//  NewsApplication
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

protocol NewsFeedViewControllerProtocol: AnyObject{
    
}

class NewsFeedViewController: UIViewController, NewsFeedViewControllerProtocol  {
    
    var presenter: NewsFeedViewPresenterProtocol!
    
    var mok: [NewsEntity] = [
            NewsEntity(thumbnail: "mokphoto1", title: "Oleg man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "https://mail.ru", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk, The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk. The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk "),
            NewsEntity(thumbnail: "mokphoto2", title: "Vadim to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru/asdfasdf/asdfasdf/asdfasdf/asdfasdfasdfasdf/asdfasdf/asdfasdf", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in")
            ]
    
//    Переменная с результатами поиска
    var searchedMok = [NewsEntity]()
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
    
    private lazy var tableView: UITableView = {
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

//Расширение для таблицы
extension NewsFeedViewController: UITableViewDataSource , UITableViewDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        Количество ячеек в таблице в зависимости от того, идет ли поиск
        if isSearching {
             return searchedMok.count
         } else {
             return mok.count
         }
    }
    
//    Конфигурация ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId, for: indexPath) as! NewsCell

//        Меняем содержимое таблицы если идет поиск
        if isSearching {
            let item = searchedMok[indexPath.row]
            cell.setupView(item: item)
            cell.selectionStyle = .none
        } else {
            let item = mok[indexPath.row]
            cell.setupView(item: item)
            cell.selectionStyle = .none
        }
        return cell
    }
    
//    При нажатии на ячейку таблицы переход в детальную новости
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetailView()
//    Задаю параметры содержимого для детальной новости
        vc.imageSource = mok[indexPath.row].thumbnail
        vc.titleText = mok[indexPath.row].title
        vc.descrText = mok[indexPath.row].descr
        vc.dateText = mok[indexPath.row].date
        vc.linkText = mok[indexPath.row].urlText
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    Поиск ищет только по заголовку поле title 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            
        } else if searchText.count > 2 {
            searchedMok = mok.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
            isSearching = true
        }
        tableView.reloadData()
    }
}

