//
//  SessionProtocol.swift
//  A protocol for sessions.
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

public protocol SessionProtocol {

    /// Convenience method to load decoded data using an URLRequest, it can throw RequestErrors.
    /// - Parameters:
    ///   - request: The URLRequest for which to load data.
    ///   - dataType: The type of deserialized object.
    /// - Throws: RequestErrors.
    /// - Returns: Deserialized object.
    func dataTask<T: Decodable> (
        _ request: URLRequest,
        dataType: T.Type
    ) async throws -> (T, URLResponse)

    var session: URLSession { get }
}
