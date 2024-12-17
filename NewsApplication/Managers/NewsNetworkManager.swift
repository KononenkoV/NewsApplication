//
//  NewsNetworkManager.swift
//  NewsApplication
//
//  Created by Вадим Кононенко on 17.12.2024.
//

import Foundation
import Alamofire

class NewsNetworkManager {
    
    let url:URL = URL(string: "https://newsapi.org/v2/everything")!
    
    func getNews(completion: @escaping ([Article]) -> Void){
        let parameters: Parameters = [
            "q" : "russia",
            "apiKey" : "3adfa3683e36492db895391e230f2f96",
            "language" : "ru",
            "pagesize" : "20"
        ]
        
        AF.request(url, method: .get, parameters: parameters).response { result in
            guard result.error == nil else {
                print(result.error!)
                return
            }
            guard let data = result.data else {return}
            do{
                let result = try JSONDecoder().decode(News.self, from: data)
                completion(result.articles)
            } catch {
                print(error)
            }
        }
    }

    }


  
    
    

