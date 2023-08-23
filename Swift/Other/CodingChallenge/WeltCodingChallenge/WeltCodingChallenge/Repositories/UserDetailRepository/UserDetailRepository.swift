//
//  UserDetailRepository.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/8.
//

import Foundation

struct UserDetailRepository: UserDetailRepoProtocol {

    func loadUserDetail(by userName: String) async throws -> UserInfo {
        let client = ServiceClient(clientService: UserDetailNetworkService(userName: userName))
        return try await client.request(dataType: UserInfo.self)
    }
}
