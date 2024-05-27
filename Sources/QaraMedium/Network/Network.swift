//
//  File.swift
//  
//
//  Created by SALGARA, YESKENDIR on 27.05.24.
//

import Foundation

public enum QaraMediumAPIError: Error {
    case encodingError, decodingError, invalidURL, noData
}

public protocol QaraMediumNetworkProtocol {
    func request<T: Decodable>(_ route: QaraMediumRoute) async -> Result<T, QaraMediumAPIError>
}

final class QaraMediumNetwork: QaraMediumNetworkProtocol {
    
    let token: String
    
    init(token: String) {
        self.token = token
    }
    
    func request<T: Decodable>(_ route: QaraMediumRoute) async -> Result<T, QaraMediumAPIError> {
        guard let url = URL(string: "\(route.baseURL)\(route.path)") else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = route.method
        request.allHTTPHeaderFields = route.header
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        if let body = route.body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                return .failure(.encodingError)
            }
        }
        print("📇", request)

        let result = try? await URLSession.shared.data(for: request)
        
        
        guard let data = result?.0 else {
            return .failure(.noData)
        }
        
        if let log = String(data: data, encoding: .utf8) {
            print("📇", log)
        }
        
        guard let response = try? JSONDecoder().decode(T.self, from: data) else {
            return .failure(.decodingError)
        }
        
        return .success(response)
    }
    
}
