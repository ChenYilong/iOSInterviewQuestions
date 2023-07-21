//
//  Repository.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

enum ApiError: Error {
    case urlError
    case networkError(Error)
    case decodingError(Error)
}

protocol Repository {
    func fetchPostList() async throws -> [Post]
    func fetchComments(id: Int) async throws -> [Comment]
}

final class ApiRepository: Repository {
    // session to be used to make the API call
    let session: URLSession

    // Make the session shared by default.
    // In unit tests, a mock session can be injected.
    init(urlSession: URLSession = .shared) {
        self.session = urlSession
    }

    private func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await session.data(from: url)
        do {
            let decoder = JSONDecoder()
            let contentObject = try decoder.decode(T.self, from: data)
            return contentObject
        } catch let error {
            throw ApiError.decodingError(error)
        }
    }

    func fetchPostList() async throws -> [Post] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw ApiError.urlError
        }

        return try await fetchData(from: url)
    }

    func fetchComments(id: Int) async throws -> [Comment] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)/comments") else {
            throw ApiError.urlError
        }

        return try await fetchData(from: url)
    }
}
