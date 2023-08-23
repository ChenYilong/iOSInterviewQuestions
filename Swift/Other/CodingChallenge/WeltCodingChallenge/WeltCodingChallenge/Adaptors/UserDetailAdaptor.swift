//
//  UserDetailAdaptor.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

struct UserDetailAdaptor {
    
    static func convent(userInfo: UserInfo) -> UserDetailModel {
        UserDetailModel(
            userName: userInfo.login,
            avatarURL: userInfo.avatar_url,
            publicRepositoryCount: userInfo.public_repos,
            followersCount: userInfo.followers,
            followingCount: userInfo.following
        )
    }
}
