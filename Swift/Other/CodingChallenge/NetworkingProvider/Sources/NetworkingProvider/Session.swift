//
//  Session.swift
//  Customised URLSession that can decode data by specific type and throw RequestErrors.
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

public class Session: SessionProtocol {

    public let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    /// Convenience method to load decoded data using an URLRequest, it can throw RequestErrors.
    /// - Parameters:
    ///   - request: The URLRequest for which to load data.
    ///   - dataType: The type of deserialized object.
    /// - Throws: RequestErrors.
    /// - Returns: Deserialized object.
    public func dataTask<T>(
        _ request: URLRequest,
        dataType: T.Type
    ) async throws -> (T, URLResponse) where T : Decodable {

        let (data, response) = try await dataTask(request)
        try validate(response: response, statusCodes: NetworkEnvironment.successStatusCodeRange)
        let result = try decode(data: data, type: dataType)
        return (result, response)
    }

    private func dataTask(_ request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await session.data(for: request)
        } catch {
            throw RequestError.requestFailed(error: error)
        }
    }
}

private extension Session {
    func validate(response: URLResponse?, statusCodes: Range<Int>) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw RequestError.unknownStatusCode
        }

        if !statusCodes.contains(httpResponse.statusCode) {
            throw RequestError.unexpectedStatusCode(code: httpResponse.statusCode)
        }
    }

    func decode<T: Decodable>(data: Data?, type: T.Type) throws -> T {
        guard
            let data = data,
            !data.isEmpty
        else {
            throw RequestError.contentEmptyData
        }

        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw RequestError.contentDecoding(error: error)
        }
    }
}
