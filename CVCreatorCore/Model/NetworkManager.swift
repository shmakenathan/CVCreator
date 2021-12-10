//
//  NetworkManager.swift
//  CVCreatorCore
//
//  Created by Nathan on 25/11/2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func send(url: URL) async throws -> LoginResponse {
        let urlSession = URLSession.shared
        let (data, _) = try await urlSession.data(from: url)
        let decodedData = try JSONDecoder().decode(LoginResponse.self, from: data)
        return decodedData
    }
    
    
    func send(urlRequest: URLRequest) async throws -> LoginResponse {
        let urlSession = URLSession.shared
        let (data, _) = try await urlSession.data(for: urlRequest)
        let decodedData = try JSONDecoder().decode(LoginResponse.self, from: data)
        return decodedData
    }
}
