//
//  AuthorizationParameters.swift
//  NewsAppVk
//
//  Created by Олег Дмитриев on 18.12.2024.
//

import Foundation

struct AuthorizationParameters {
    
    enum ResponseType: String {
        case code
        case token
    }
    enum DisplayType: String {
        case page
        case popup
        case mobile
    }
    enum ScopeType: String {
        case online
        case offline
    }
    
    var clientId: String
    var redirectUri: String
    var display: DisplayType
    var scope: ScopeType
    var responseType: ResponseType
}
