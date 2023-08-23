//
//  SearchListService+Live.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

extension SearchListService {

    static func liveValue(context: Context) -> Self {
        Self (
            searchUserName: { userInfo in
                let repo = context[SearchListRepoProtocol.self]
                let result = try await repo.searchUsers(by: userInfo)
                return SearchResultAdaptor.convertSearchResult(result: result)
            }
        )
    }
}
