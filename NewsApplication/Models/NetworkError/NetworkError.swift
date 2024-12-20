//
//  NetworkError.swift
//  NewsAppVk
//
//  Created by Олег Дмитриев on 18.12.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingError(underlyingError: Error)
    case unableToComplete
    case clientError(statusCode: Int, message: String)
    case serverError(statusCode: Int, message: String)
    case unexpectedError
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Неверный URL", comment: "Ошибка сети")
        case .invalidResponse:
            return NSLocalizedString("Неверный или неожиданный ответ от сервера", comment: "Ошибка сети")
        case .invalidData:
            return NSLocalizedString("Получены неверные или поврежденные данные", comment: "Ошибка сети")
        case .decodingError(let underlyingError):
            return NSLocalizedString("Не удалось декодировать данные: \(underlyingError.localizedDescription)", comment: "Ошибка сети")
        case .unableToComplete:
            return NSLocalizedString("Невозможно завершить сетевой запрос", comment: "Ошибка сети")
        case .clientError(let statusCode, let message):
            return NSLocalizedString("Ошибка клиента (\(statusCode)): \(message)", comment: "Ошибка сети")
        case .serverError(let statusCode, let message):
            return NSLocalizedString("Ошибка сервера (\(statusCode)): \(message)", comment: "Ошибка сети")
        case .unexpectedError:
            return NSLocalizedString("Произошла непредвиденная ошибка", comment: "Ошибка сети")
        }
    }
}
