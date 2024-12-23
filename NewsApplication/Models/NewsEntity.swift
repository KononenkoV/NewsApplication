//
//  NewsEntity.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import Foundation

struct News: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String?
//  Ссылка будет использоваться как айди
    let urlToImage: String?
    let url: String?
    let publishedAt: String?
    let content: String?
    
    static func mockData() -> [Article] {
        [
            Article(title: "Oleg man spent $15,000 making a Tesla Cybertruck out of wood", urlToImage: "mokphoto1", url: "https://mail.ru", publishedAt: "13.12.24", content: "The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk, The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk. The wooden Cybertruck replica includes LED lights and a X logo. ND - WoodArt A Vietnamese man built a fully functional replica of Tesla's Cybertruck out of wood. Truong Van Dao's been driving his family around in the car, which is being sent to Elon Musk "),
            
            Article(title: "Huawei to move smart car operations to new joint company with Changan", urlToImage: "mokphoto2", url: "www.mail.ru", publishedAt: "13.11.24", content: "China's Huawei said on Sunday it will move core technologies and resources in its smart car unit, which has chalked up robust sales for a number of new vehicles, to a new joint company owned up to 40% by automaker Changan Auto. The new company will engage in")
        ]
    }
}
