//
//  File.swift
//  
//
//  Created by SALGARA, YESKENDIR on 27.05.24.
//

import Foundation

public struct QaraMediumResponse<T: Decodable>: Decodable {
    public var data: T?
    public var errors: [QaraMediumError]?
}

public struct QaraMediumError: Decodable {
    var message: String
    var code: Int
}
