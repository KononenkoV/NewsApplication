//
//  NewsFeedViewPresenter.swift
//  NewsApplication
//
//  Created by Вадим Кононенко on 11.12.2024.
//


import Foundation

protocol ErrorNilNewsPresenterProtocol: AnyObject {
    var newsFeed: [Article] {get set}
    func sendRequest()
}

class ErrorNilNewsPresenter: ErrorNilNewsPresenterProtocol {
    weak var view: ErrorNilNewsViewControllerProtocol?

//  private let vkNetworkManager = NetworkManager.shared
    
    private var vkPostManager = VKPostsManager()
    var vkPosts: [VKResponseItem] = []
    var newsFeed: [Article] = []
    
    init(view: ErrorNilNewsViewControllerProtocol?) {
        self.view = view
    }
    
    
    
    func sendRequest(){
         
        vkPostManager.sendRequest { [weak self] vkResponce in
                   self?.vkPosts = vkResponce.response.items
                   
//            Трансформирую модель ВК в мою модель
            self?.vkPosts.forEach { post in
               
                var imgUrl: String?
                
                guard
                    let attachments = post.attachments,
                    let attachment = attachments.first
                else { return }
                
                switch attachment.type {
                case "photo":
                    let photo = attachment.photo
                    imgUrl = photo?.sizes?.first?.url
                       
                case "video":
                    let photo = attachment.video
                    imgUrl = photo?.image?.last?.url
                    
                default:
                    imgUrl = ""
                }
                
                let articleItem = Article(title: String(post.text.prefix(20))+"...", urlToImage: imgUrl, url: "vk.com", publishedAt: post.date.description, content: post.text)
                self?.newsFeed.append(articleItem)
            }
                   DispatchQueue.main.async {
                       self?.view?.tableView.reloadData()
                   }
               }
    }
}


