//
//  NetworkService.swift
//  A protocol helps define a request with the necessary elements.
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

public protocol NetworkService {
    var baseURL: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var httpBody: Encodable? { get }
    var headers: [String: String]? { get }
    var queryParameters: [URLQueryItem]? { get }
    var timeout: TimeInterval? { get }
}

public extension NetworkService {

    var urlRequest: URLRequest {
        guard let url = self.url else {
            fatalError("URL could not be built")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.timeoutInterval = timeout ?? NetworkEnvironment.requestDefaultTimeout

        if let httpBody = httpBody {
            request.httpBody = try? httpBody.jsonEncode()
        }

        return request
    }
}

private extension NetworkService {

    var url: URL? {
        let urlComponents = URLComponents(string: baseURL)
        guard var components = urlComponents else {
            return URL(string: baseURL)
        }

        components.path = components.path.appending(path)

        guard let queryParams = queryParameters else {
            return components.url
        }

        if components.queryItems == nil {
            components.queryItems = []
        }

        components.queryItems?.append(contentsOf: queryParams)

        return components.url
    }
}

private extension Encodable {

    func jsonEncode() throws -> Data? {
        try JSONEncoder().encode(self)
    }
}
