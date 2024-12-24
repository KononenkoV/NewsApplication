//
//  NetworkManager.swift
//  NewsAppVk
//
//  Created by Олег Дмитриев on 18.12.2024.
//




//ЭТОТ ФАЙЛ КАНДИДАТ НА СТИРАНИЕ ЦЕЛИКОМ

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let authClientURL: String = "https://oauth.vk.com/authorize?client_id=1&redirect_uri=http://example.com/callback&scope=12&display=mobile"
    private let newsApiURL: String = "https://newsapi.org/v2/everything?q=errornil&from=2024-12-18&softBy=publishedAt&apiKey=2eb9eae4ed484f9b8d6b87fa8184f987"
    private let decoder = JSONDecoder()
    
    private func parseURLComponents(url: String) throws -> URLComponents {
        
        guard let encodedBaseURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let baseComponents = URLComponents(string: encodedBaseURL) else {
            throw NetworkError.invalidURL
        }
        
        return baseComponents
    }
    
    private func requestGetNews<T: Codable>(searchQuery: String,
                                            date: String,
                                            sortedBy: String,
                                            responseType: T.Type) async throws -> T
    {
        guard var components = URLComponents(string: newsApiURL),
              let separatedQuery = separatedURLByComponents(from: components.query)
        else { throw NetworkError.invalidURL }
        
        
        var queryItems = [URLQueryItem]()
        let apiKey = separatedQuery["apiKey"]
        
        queryItems.append(URLQueryItem(name: "q", value: searchQuery))
        queryItems.append(URLQueryItem(name: "from", value: date))
        queryItems.append(URLQueryItem(name: "sortBy", value: sortedBy))
        queryItems.append(URLQueryItem(name: "apiKey", value: apiKey))
        
        components.queryItems = queryItems
        
        guard let url = components.url else { throw NetworkError.invalidURL}
        
        var requestURL = URLRequest(url: url)
        requestURL.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: requestURL)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return try decoder.decode(responseType, from: data)
        default:
            let errorData = String(data: data, encoding: .utf8) ?? ""
            throw NetworkError.serverError(statusCode: httpResponse.statusCode, message: errorData)
        }
    }
    
    func separatedURLByComponents(from query: String?) -> [String:String]? {
        query?.components(separatedBy: "&").map {
            $0.components(separatedBy: "=")
        }.reduce([String:String]()) { res, param in
            var dict = res
            let key = param[0]
            let value = param[1]
            dict[key] = value
            return dict
        }
    }
    
    func createEndpoint(from authParameters: AuthorizationParameters) throws -> URL? {
        var components = try parseURLComponents(url: authClientURL)
        components.queryItems = [
            URLQueryItem(name: "client_id", value: authParameters.clientId),
            URLQueryItem(name: "redirect_uri", value: authParameters.redirectUri),
            URLQueryItem(name: "response_type", value: authParameters.responseType.rawValue),
            URLQueryItem(name: "display", value: authParameters.display.rawValue),
            URLQueryItem(name: "scope", value: authParameters.scope.rawValue)
        ]
        return components.url
    }
    
    func getNews(searchQuery: String,
                 date: String,
                 sortedBy: String = "publishedAt"
    ) async throws -> Response {
        try await requestGetNews(searchQuery: searchQuery,
                                 date: date,
                                 sortedBy: sortedBy,
                                 responseType: Response.self
        )
    }
}
