//
//  NewsFeedViewController.swift
//  NewsApplication
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    var mok: [NewsEntity] = [
            NewsEntity(thumbnail: "mokphoto1", title: "Oleg man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "https://mail.ru", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk, The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk. The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk "),
            NewsEntity(thumbnail: "mokphoto2", title: "Vadim to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru/asdfasdf/asdfasdf/asdfasdf/asdfasdfasdfasdf/asdfasdf/asdfasdf", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in")
            ]
    
    var searchedMok = [NewsEntity]()

    var isSearching = false
    var searchBar = UISearchBar()
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        $0.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseId)
           return $0
       }(UITableView(frame:view.frame, style: .plain))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appNewsBg
        title = "Новости"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubviews(tableView)

        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.searchBarStyle = .prominent
        searchBar.placeholder = "Поиск новости VK..."
        searchBar.tintColor = UIColor.appGrayText
        searchBar.barTintColor = UIColor.appBlack

        navigationItem.titleView = searchBar
        navigationController?.hidesBarsOnSwipe = true
        
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
    
    // MARK: Search filter
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        let text: String = self.searchBar.text ?? ""
//        self.filteredNews = mok.filter { $0.title.contains(text) }
//        
//        self.tableView.reloadData()
//        self.searchBar.delegate = self
//        
//    }
}

//// MARK: UISearchBarDelegate
//extension NewsFeedViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let text = searchBar.text else { return }
//        searchBar.resignFirstResponder()
//        mok.removeAll()
//    }
//}
//
//// MARK:
//extension NewsFeedViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else { return }
//    }
//}


extension NewsFeedViewController: UITableViewDataSource , UITableViewDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
             return searchedMok.count
         } else {
             return mok.count
         }
    }
    
//    Конфигурация ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId, for: indexPath) as! NewsCell

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
        vc.imageSource = mok[indexPath.row].thumbnail
        vc.titleText = mok[indexPath.row].title
        vc.descrText = mok[indexPath.row].descr
        vc.dateText = mok[indexPath.row].date
        vc.linkText = mok[indexPath.row].urlText
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedMok = mok.filter({
            $0.title.lowercased().prefix(searchText.count) == searchText.lowercased()
//            $0.title.lowercased().prefixMatch(of: searchText.lowercased()) == searchText.lowercased()
        })
        isSearching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.isSearching = false
        searchBar.text = ""
        tableView.reloadData()
     }
}

