//
//  File.swift
//  
//
//  Created by SALGARA, YESKENDIR on 27.05.24.
//

import Foundation



public enum QaraMediumRoute {
    case create(article: QaraMediumArticle, authorId: String)
    case me
    
    var baseURL: String {
        return "https://api.medium.com/v1"
    }
    
    var path: String {
        switch self {
        case let .create(_, authorId):
            return "/users/\(authorId)/posts"
        case .me:
            return "/me"
        }
    }
    
    var method: String {
        switch self {
        case .create:
            return "POST"
        case .me:
            return "GET"
        }
    }
    
    var body: [String: Any]? {
        var body: [String: Any] = [:]
        switch self {
        case .create(let article, _):
            body["title"] = article.title
            body["contentFormat"] = article.contentFormat
            body["content"] = article.content
            body["tags"] = article.tags
            body["publishStatus"] = article.publishStatus
            if let canonicalUrl = article.canonicalUrl {
                body["canonicalUrl"] = canonicalUrl
            }
        case .me:
            return nil
        }
        return body
    }
    
    var header: [String: String] {
        var header: [String: String] = [:]
        switch self {
        case .create, .me:
            header["Content-Type"] = "application/json"
        }
        return header
    }
    
}
