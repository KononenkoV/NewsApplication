//
//  Response.swift
//  NewsAppVk
//
//  Created by Олег Дмитриев on 18.12.2024.
//

import Foundation

// MARK: - Response
struct Response: Codable {
    let articles: [NewsArticle]
}

// MARK: - Article
struct NewsArticle: Codable {
    let author: String?
    let title, description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
}
