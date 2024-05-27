//
//  File.swift
//  
//
//  Created by SALGARA, YESKENDIR on 27.05.24.
//

import Foundation

public enum PublishStatus: String {
    case publish = "public"
    case draft = "draft"
}

public enum ContentFormat: String {
    case markdown, html
}

public struct QaraMediumArticle {
    var title: String
    var content: String
    var contentFormat: ContentFormat
    var tags: [String]
    var canonicalUrl: String?
    var publishStatus: PublishStatus
    
    public init(title: String, 
                content: String,
                contentFormat: ContentFormat = .html,
                tags: [String] = [],
                canonicalUrl: String? = nil,
                publishStatus: PublishStatus = .draft) {
        self.title = title
        self.content = content
        self.contentFormat = contentFormat
        self.tags = tags
        self.canonicalUrl = canonicalUrl
        self.publishStatus = publishStatus
    }
}

public final class QaraMediumAPI {
    
    private let network: QaraMediumNetworkProtocol
    private let token: String
    
    public init(token: String, network: QaraMediumNetworkProtocol? = nil) {
        self.network = network ?? QaraMediumNetwork(token: token)
        self.token = token
    }

    public func getMe() async -> Result<QaraMediumResponse<QaraMediumUser>, QaraMediumAPIError> {
        return await network.request(.me)
    }
    
    public func create(article: QaraMediumArticle, authorId: String) async -> Result<QaraMediumResponse<QaraMediumPost>, QaraMediumAPIError> {
        return await network.request(.create(article: article, authorId: authorId))
    }

}
