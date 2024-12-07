//
//  NewsFeedViewController.swift
//  NewsApplication
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    var mok: [NewsEntity] = [
            NewsEntity(thumbnail: "mokphoto1", title: "Заголовок новости 1", date: "13.12.24", urlText: "www.mail.ru", descr: "Полный текст новости"),
            NewsEntity(thumbnail: "mokphoto2", title: "Заголовок новости 2", date: "13.11.24", urlText: "www.mail.ru", descr: "Полный текст новости"),
            NewsEntity(thumbnail: "mokphoto1", title: "Заголовок новости 3", date: "12.12.24", urlText: "www.mail.ru", descr: "Полный текст новости"),
            NewsEntity(thumbnail: "mokphoto2", title: "Заголовок новости 2", date: "13.11.24", urlText: "www.mail.ru", descr: "Полный текст новости"),
            NewsEntity(thumbnail: "mokphoto1", title: "Заголовок новости 1", date: "13.12.24", urlText: "www.mail.ru", descr: "Полный текст новости"),
            NewsEntity(thumbnail: "mokphoto2", title: "Заголовок новости 2", date: "13.11.24", urlText: "www.mail.ru", descr: "Полный текст новости"),
            NewsEntity(thumbnail: "mokphoto1", title: "Заголовок новости 3", date: "12.12.24", urlText: "www.mail.ru", descr: "Полный текст новости"),
            NewsEntity(thumbnail: "mokphoto2", title: "Заголовок новости 2", date: "13.11.24", urlText: "www.mail.ru", descr: "Полный текст новости"),
    ]
        
    lazy var scrollView: UIScrollView = {
        $0.backgroundColor = .clear
        $0.addSubview(scrollContent)
        return $0
    }(UIScrollView(frame: view.frame))
    
    lazy var scrollContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(tableView)
        return $0
    }(UIView(frame: view.frame))
    
        
    private lazy var tableView: UITableView = {
           $0.dataSource = self
           $0.delegate = self
           $0.separatorStyle = .none
        $0.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseId)
           return $0
       }(UITableView(frame:view.frame, style: .plain))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Новости"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubviews(scrollView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
//            welcomeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
//            welcomeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            welcomeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            
//            welcomeSubtitle.topAnchor.constraint(equalTo: welcomeTitle.bottomAnchor, constant: 6),
//            welcomeSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            welcomeSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
//            welcomeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
//            welcomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            welcomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
        ])
    }
}

extension NewsFeedViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mok.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = mok[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId, for: indexPath) as! NewsCell
        cell.setupView(item: item)
        cell.selectionStyle = .none
        return cell
    }
}
