//
//  File.swift
//  
//
//  Created by SALGARA, YESKENDIR on 07.06.24.
//

import Foundation

public struct QaraMediumArticle {
    var title: String
    var content: String
    var contentFormat: ContentFormat
    var tags: [String]
    var canonicalUrl: String?
    var publishStatus: PublishStatus

    public init(
        title: String,
        content: String,
        contentFormat: ContentFormat = .html,
        tags: [String] = [],
        canonicalUrl: String? = nil,
        publishStatus: PublishStatus = .draft
    ) {
        self.title = title
        self.content = content
        self.contentFormat = contentFormat
        self.tags = tags
        self.canonicalUrl = canonicalUrl
        self.publishStatus = publishStatus
    }
}
