//
//  MainNetworkManager.swift
//  RestRoomFinder
//
//  Created by Yilong Chen on 09/06/2024.
//

import Foundation

// Main implementation of Network Manager
struct MainNetworkManager: NetworkManager {
    
    // Generic request function
    private func request<T: Decodable>(
        url: URL,
        method: HTTPMethod,
        body: Data? = nil
    ) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.requestFailed
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.decodingFailed
        }
    }
    
    // GET Request
    func get<T: Decodable>(
        urlString: String
    ) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        return try await request(url: url, method: .GET)
    }
    
    // POST Request
    func post<T: Decodable, U: Encodable>(
        urlString: String,
        body: U
    ) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        let bodyData = try JSONEncoder().encode(body)
        return try await request(url: url, method: .POST, body: bodyData)
    }
}
