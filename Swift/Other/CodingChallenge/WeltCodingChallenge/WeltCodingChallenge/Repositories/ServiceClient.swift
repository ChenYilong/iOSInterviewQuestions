//
//  ServiceClient.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation
import NetworkingProvider

struct ServiceClient: NetworkProviderProtocol {

    var urlSession: NetworkingProvider.SessionProtocol
    var service: NetworkingProvider.NetworkService

    init(session: SessionProtocol = Session(), clientService: NetworkService) {
        urlSession = session
        service = clientService
    }

    func request<T>(dataType: T.Type) async throws -> T where T : Decodable {
        let (data, _ ) = try await urlSession.dataTask(service.urlRequest, dataType: T.self)
        return data
    }
}
