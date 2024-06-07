//
//  File.swift
//
//
//  Created by SALGARA, YESKENDIR on 27.05.24.
//

import Foundation

public enum PublishStatus: String {
    case publish = "public"
    case draft
}

public enum ContentFormat: String {
    case markdown, html
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

    public func getPosts(username: String) async -> Result<QaraMediumRSSResponse, QaraMediumAPIError> {
        return await network.request(.posts(username: username))
    }
}
