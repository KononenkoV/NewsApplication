//
//  NewsEntity.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import Foundation

struct NewsEntity {
    let id: UUID = UUID()

    let thumbnail: String
    let title: String
    let date: String
    let urlText: String
    let descr: String
    
    static func mockData() -> [NewsEntity] {
        [
            NewsEntity(thumbnail: "", title: "", date: "", urlText: "", descr: ""),
            NewsEntity(thumbnail: "", title: "", date: "", urlText: "", descr: ""),
            NewsEntity(thumbnail: "", title: "", date: "", urlText: "", descr: ""),
        ]
    }
}
