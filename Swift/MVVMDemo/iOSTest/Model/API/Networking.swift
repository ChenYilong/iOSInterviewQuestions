//
//  NetworkService.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/29.
//

import Foundation

enum ApiError: Error {
    case urlError
    case networkError(Error)
    case decodingError(Error)
}

protocol Request {
    associatedtype RequestResponse: Response
    var url: URL { get }
    var method: String { get }

    func handleResponse(data: Data, response: URLResponse) throws -> RequestResponse
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

class Networking {
    // session to be used to make the API call
    let session: URLSession

    // Make the session shared by default.
    // In unit tests, a mock session can be injected
    init(urlSession: URLSession = .shared) {
        self.session = urlSession
    }

    func request<R: Request>(request: R) async throws -> R.RequestResponse where R.RequestResponse: Response {
        let (data, response) = try await session.data(from: request.url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.urlError
        }
        return try request.handleResponse(data: data, response: httpResponse)
    }
}
