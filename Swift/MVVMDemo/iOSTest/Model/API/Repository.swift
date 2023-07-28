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
    func fetchPosts() async throws -> [Post]
    func fetchComments(id: Int) async throws -> [Comment]
}

protocol Request {
    associatedtype RequestDataType: Response
    var url: URL { get }
    var method: String { get }

    func handleResponse(data: Data, response: URLResponse) throws -> RequestDataType
}

extension Request {
    var method: String {
        return "GET"
    }
}

protocol Response: Decodable {
    var statusCode: Int { get }
    var data: Data { get }
    var errMsg: String? { get }
    
    init(statusCode: Int, data: Data, errMsg: String?)
    func decodeData<T: Decodable>() throws -> T
}

extension Response {
    func decodeData<T: Decodable>() throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: self.data)
    }
}

class ContentRequest<DataType: Response>: Request {
    typealias RequestDataType = DataType

    let url: URL

    init(url: URL) {
        self.url = url
    }

    func handleResponse(data: Data, response: URLResponse) throws -> DataType {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.urlError
        }
        return DataType(statusCode: httpResponse.statusCode, data: data, errMsg: nil)
    }
}

class ContentResponse: Response {
    var statusCode: Int
    var data: Data
    var errMsg: String?

    required init(statusCode: Int, data: Data, errMsg: String?) {
        self.statusCode = statusCode
        self.data = data
        self.errMsg = errMsg
    }

    func decodeData<T: Decodable>() throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}

class PostRequest: ContentRequest<PostResponse> {
    init() {
        super.init(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    }

    override func handleResponse(data: Data, response: URLResponse) throws -> PostResponse {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.urlError
        }
        return PostResponse(statusCode: httpResponse.statusCode, data: data, errMsg: nil)
    }
}

class CommentRequest: ContentRequest<CommentResponse> {
    init(id: Int) {
        super.init(url: URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)/comments")!)
    }

    override func handleResponse(data: Data, response: URLResponse) throws -> CommentResponse {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.urlError
        }
        return CommentResponse(statusCode: httpResponse.statusCode, data: data, errMsg: nil)
    }
}

class PostResponse: ContentResponse {
    var posts: [Post] {
        do {
            return try decodeData()
        } catch {
            print("Error: \(error)")
            return []
        }
    }
}

class CommentResponse: ContentResponse {
    var comments: [Comment] {
        do {
            return try decodeData()
        } catch {
            print("Error: \(error)")
            return []
        }
    }
}

final class ApiRepository: Repository {
    // session to be used to make the API call
    let session: URLSession

    // Make the session shared by default.
    // In unit tests, a mock session can be injected.
    init(urlSession: URLSession = .shared) {
        self.session = urlSession
    }

    private func fetchData<R: Request>(_ request: R) async throws -> R.RequestDataType where R.RequestDataType: Response {
        let (data, response) = try await session.data(from: request.url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.urlError
        }
        return try request.handleResponse(data: data, response: httpResponse)
    }

    func fetchPosts() async throws -> [Post] {
        let request = PostRequest()
        let response = try await fetchData(request)
        return try response.decodeData()
    }

    func fetchComments(id: Int) async throws -> [Comment] {
        let request = CommentRequest(id: id)
        let response = try await fetchData(request)
        return try response.decodeData()
    }
}
