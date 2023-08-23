//
//  UserDetailRepoProtocol.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/8.
//

import Foundation

protocol UserDetailRepoProtocol: Repository {
    func loadUserDetail(by userName: String) async throws -> UserInfo
}
