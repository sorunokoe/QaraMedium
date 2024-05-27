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
    var contentFormat: ContentFormat = .html
    var tags: [String] = []
    var canonicalUrl: String? = nil
    var publishStatus: PublishStatus = PublishStatus.draft
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
    
    public func create(article: QaraMediumArticle, authorId: String) async -> Result<QaraMediumResponse<String>, QaraMediumAPIError> {
        return await network.request(.create(article: article, authorId: authorId))
    }

}
