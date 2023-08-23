//
//  SearchListRepository.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

struct SearchListRepository: SearchListRepoProtocol {
    func searchUsers(by searchedInfo: SearchedUserModel) async throws -> SearchedUsersResult {
        let client = ServiceClient(clientService: SearchUserNetworkService(searchedUser: searchedInfo))
        return try await client.request(dataType: SearchedUsersResult.self)
    }
}
