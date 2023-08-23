//
//  SearchResultAdaptor.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

struct SearchResultAdaptor {

    static func convertSearchResult(result: SearchedUsersResult) -> SearchedResultModel {
        SearchedResultModel(
            totalCount: result.total_count,
            items: result.items.map {
                convertResultUser(user: $0)
            }
        )
    }

    static func convertResultUser(user: GithubUser) -> ResultUserItemModel {
        ResultUserItemModel(
            userName: user.login,
            avatarURL: user.avatar_url,
            userInfoURL: user.url
        )
    }
}
