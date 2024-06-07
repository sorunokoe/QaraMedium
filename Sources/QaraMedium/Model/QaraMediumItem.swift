//
//  File.swift
//  
//
//  Created by SALGARA, YESKENDIR on 07.06.24.
//

import Foundation

public struct QaraMediumItem: Decodable {
    let title: String
    let pubDate: String
    let link: String
    let guid: String
    let author: String
    let thumbnail: String
    let description: String
    let content: String
    let categories: [String]
}
