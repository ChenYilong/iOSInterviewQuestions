//
//  UserDetailModel.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

struct UserDetailModel: Equatable {
    let userName: String
    let avatarURL: String
    let publicRepositoryCount: Int
    let followersCount: Int
    let followingCount: Int
}
