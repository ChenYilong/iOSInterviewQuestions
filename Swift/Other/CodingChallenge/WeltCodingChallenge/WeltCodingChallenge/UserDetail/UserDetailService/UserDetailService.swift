//
//  UserDetailService.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

struct UserDetailService {
    var loadUserDetail: @Sendable (String) async throws -> UserDetailModel
}
