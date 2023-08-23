//
//  NetworkingProvider.swift
//  A protocol for network clients.
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

public protocol NetworkProviderProtocol {

    var urlSession: SessionProtocol { get }
    var service: NetworkService { get }

    func request<T>(dataType: T.Type) async throws -> T where T: Decodable
}
