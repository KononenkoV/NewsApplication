//
//  StorageManager.swift
//  NewsAppVk
//
//  Created by Олег Дмитриев on 18.12.2024.
//

import Foundation
import UIKit

class StorageManager {
    
    static let shared = StorageManager()
    private init() {}
    
    var token: String {
        get {
            UserDefaults.standard.string(forKey: "token") ?? ""
        }
        set {
            // Сохраняем новое значение токена в UserDefaults
            UserDefaults.standard.setValue(newValue, forKey: "token")
            UserDefaults.standard.setValue(true, forKey: "isLogin")
        }
    }
    
    func saveResponseToUserDefaults(response: [NewsArticle]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(response) {
            UserDefaults.standard.set(encoded, forKey: "savedResponse")
        }
    }
    
    func loadResponseFromUserDefaults() -> [NewsArticle]? {
        if let savedResponseData = UserDefaults.standard.data(forKey: "savedResponse") {
            let decoder = JSONDecoder()
            if let loadedResponse = try? decoder.decode([NewsArticle].self, from: savedResponseData) {
                return loadedResponse
            }
        }
        return nil
    }
    
    let authorizationParameters = AuthorizationParameters(
        clientId: "52797766",
        redirectUri: "https://oauth.vk.com/blank.html",
        display: .mobile,
        scope: .offline,
        responseType: .token
    )
    
    func clearData(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func saveToKeychain(_ id: String, object: NewsArticle) {
        guard let dataToStore = try? JSONEncoder().encode(object) else { return }
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: id,
            kSecValueData as String: dataToStore
        ]
        
        // Удаляем предыдущее значение, если оно существует
        SecItemDelete(query as CFDictionary)
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else { return }
    }
    
    func removeFromKeychain(id: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: id
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        if status != errSecSuccess {
            print("Ошибка при удалении из Keychain: \(status)")
        }
    }
    
    func getAllFromKeychain() -> [NewsArticle] {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitAll,
            kSecReturnAttributes as String: kCFBooleanTrue!
        ]
        
        var items: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &items)
        guard status == errSecSuccess else { return [] }
        
        guard let existingItems = items as? [[String: Any]] else { return [] }
        var articles: [NewsArticle] = []
        
        for (item) in existingItems {
            if let data = item[kSecValueData as String] as? Data {
                if let article = try? JSONDecoder().decode(NewsArticle.self, from: data) {
                    articles.append(article)
                }
            }
        }
        return articles
    }
    
    func isArticleCached(url: String) -> Bool {
        let cachedArticles = getAllFromKeychain()
        return cachedArticles.contains(where: { $0.url == url })
    }
    
    func toggleArticleInCache(_ article: NewsArticle) {
        let isCached = isArticleCached(url: article.url)
        
        if isCached {
            // Статья уже в кэше, удаляем её
            removeFromKeychain(id: article.url)
        } else {
            // Статьи нет в кэше, добавляем её
            saveToKeychain(article.url, object: article)
        }
    }
    
    func clearAllFromKeychain() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        if status != errSecSuccess {
            print("Ошибка при очистке Keychain: \(status)")
        }
    }
}
