//
//  UserDetailService+Live.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/8.
//

import Foundation

extension UserDetailService {

    static func liveValue(context: Context) -> Self {
        Self (
            loadUserDetail: { userName in
                let repo = context[UserDetailRepoProtocol.self]
                let userInfo = try await repo.loadUserDetail(by: userName)
                return UserDetailAdaptor.convent(userInfo: userInfo)
            }
        )
    }
}
