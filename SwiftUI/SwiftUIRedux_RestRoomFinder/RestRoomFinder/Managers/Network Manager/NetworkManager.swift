//
//  NetworkManager.swift
//  RestRoomFinder
//  NetworkManager class that is async-await based
//  Created by Yilong Chen on 09/06/2024.
//

import Foundation

// Enum for HTTP Methods
enum HTTPMethod: String {
    case GET
    case POST
}

// Enum for Network Errors
enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingFailed
}

// Protocol for Network Manager
protocol NetworkManager {
    func get<T: Decodable>(urlString: String) async throws -> T
    func post<T: Decodable, U: Encodable>(urlString: String, body: U) async throws -> T
}
