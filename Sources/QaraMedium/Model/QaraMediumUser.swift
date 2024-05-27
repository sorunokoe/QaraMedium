//
//  File.swift
//  
//
//  Created by SALGARA, YESKENDIR on 27.05.24.
//

import Foundation

public struct QaraMediumUser: Decodable {
    public var id: String
    var username: String
    var name: String
    var url: String
    var imageUrl: String
    
    public init(id: String, usernam e: String, name: String, url: String, imageUrl: String) {
        self.id = id
        self.username = username
        self.name = name
        self.url = url
        self.imageUrl = imageUrl
    }
}
