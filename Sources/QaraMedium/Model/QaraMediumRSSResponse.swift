//
//  File.swift
//  
//
//  Created by SALGARA, YESKENDIR on 07.06.24.
//

import Foundation

public struct QaraMediumRSSResponse: Decodable {
    let status: String
    let feed: QaraMediumFeed
    let items: [QaraMediumItem]
}

public struct QaraMediumFeed: Decodable {
    let url: String
    let title: String
    let link: String
    let author: String
    let description: String
    let image: String
}
