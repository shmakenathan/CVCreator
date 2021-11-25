//
//  NetworkManager.swift
//  CVCreatorCore
//
//  Created by Nathan on 25/11/2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func send<T: Decodable>(url: URL) async throws -> T {
        let urlSession = URLSession.shared
        let (data, _) = try await urlSession.data(from: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
