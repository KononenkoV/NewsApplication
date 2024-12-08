//
//  NewsFeedViewController.swift
//  NewsApplication
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    var mok: [NewsEntity] = [
            NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "https://mail.ru", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk, The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk. The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk "),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru/asdfasdf/asdfasdf/asdfasdf/asdfasdfasdfasdf/asdfasdf/asdfasdf", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in"),    NewsEntity(thumbnail: "mokphoto1", title: "This man spent $15,000 making a Tesla Cybertruck out of wood", date: "13.12.24", urlText: "businessinsider.com", descr: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk"),
            NewsEntity(thumbnail: "mokphoto2", title: "Huawei to move smart car operations to new joint company with Changan", date: "13.11.24", urlText: "www.mail.ru", descr: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in")
            ]
        
//    lazy var scrollView: UIScrollView = {
//        $0.backgroundColor = .clear
//        $0.addSubview(scrollContent)
//        return $0
//    }(UIScrollView(frame: view.frame))
    
//    lazy var scrollContent: UIView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.addSubview(tableView)
//        return $0
//    }(UIView())
    
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

extension NewsFeedViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mok.count
    }
    
//    Конфигурация ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = mok[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId, for: indexPath) as! NewsCell
        cell.setupView(item: item)
        cell.selectionStyle = .none
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
}

