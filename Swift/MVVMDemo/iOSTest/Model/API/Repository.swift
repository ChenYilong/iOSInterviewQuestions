//
//  Repository.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

class ContentRequest<DataType: Response>: Request {
    typealias RequestResponse = DataType
    
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
}

class CommentRequest: ContentRequest<CommentResponse> {
    init(id: Int) {
        super.init(url: URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)/comments")!)
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

