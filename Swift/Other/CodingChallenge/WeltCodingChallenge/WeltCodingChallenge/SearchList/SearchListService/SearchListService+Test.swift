//
//  SearchListService+Test.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Dependencies
import Foundation

extension SearchListService: TestDependencyKey {

    static let testValue = Self(
        searchUserName: unimplemented("\(Self.self).searchUserName")
    )
}

extension SearchListService {

    static let mockValue = Self(
        searchUserName: { searchedUser in
            guard let url = Bundle.main.url(forResource: "ResultPage\(searchedUser.page)", withExtension: "json") else {
                throw MockError.FailedToLoadJson
            }

            let data = try Data(contentsOf: url)
            let searchedUsersResult = try JSONDecoder().decode(SearchedUsersResult.self, from: data)
            return SearchResultAdaptor.convertSearchResult(result: searchedUsersResult)
        }
    )
}
