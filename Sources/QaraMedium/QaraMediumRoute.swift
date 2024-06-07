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
    case posts(username: String)
    
    var baseURL: String {
        switch self {
        case let .posts(username):
            return "https://api.rss2json.com/v1"
        default:
            return "https://api.medium.com/v1"
        }
    }
    
    var path: String {
        switch self {
        case let .create(_, authorId):
            return "/users/\(authorId)/posts"
        case .me:
            return "/me"
        case let .posts(username):
            return "/api.json?rss_url=https://medium.com/feed/@\(username)"
        }
    }
    
    var method: String {
        switch self {
        case .create:
            return "POST"
        case .me, .posts:
            return "GET"
        }
    }
    
    var body: [String: Any]? {
        var body: [String: Any] = [:]
        switch self {
        case .create(let article, _):
            body["title"] = article.title
            body["contentFormat"] = article.contentFormat.rawValue
            body["content"] = article.content
            body["tags"] = article.tags
            body["publishStatus"] = article.publishStatus.rawValue
            if let canonicalUrl = article.canonicalUrl {
                body["canonicalUrl"] = canonicalUrl
            }
        case .me, .posts:
            return nil
        }
        return body
    }
    
    var header: [String: String] {
        var header: [String: String] = [:]
        switch self {
        case .create, .me, .posts:
            header["Content-Type"] = "application/json"
        }
        return header
    }
    
}
