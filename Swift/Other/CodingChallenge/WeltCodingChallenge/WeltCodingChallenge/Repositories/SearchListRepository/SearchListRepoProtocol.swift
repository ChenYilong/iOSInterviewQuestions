//
//  SearchListRepoProtocol.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

protocol SearchListRepoProtocol: Repository {
    func searchUsers(by searchedInfo: SearchedUserModel) async throws -> SearchedUsersResult
}
