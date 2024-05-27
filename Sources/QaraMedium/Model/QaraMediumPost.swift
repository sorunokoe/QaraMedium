//
//  File.swift
//  
//
//  Created by SALGARA, YESKENDIR on 27.05.24.
//

import Foundation

public struct QaraMediumPost: Decodable {
    var id: String
    var title: String
    var authorId: String
    var url: String
    var canonicalUrl: String
    var publishStatus: String
    var license: String
    var licenseUrl: String
    var tags: [String]
}
