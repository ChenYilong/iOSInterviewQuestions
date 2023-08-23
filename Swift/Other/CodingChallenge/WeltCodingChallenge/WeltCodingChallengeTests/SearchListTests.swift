//
//  SearchListTests.swift
//  SearchListTests
//
//  Created by Jacklandrin on 2023/8/7.
//

import ComposableArchitecture
import XCTest

@MainActor
final class SearchListTests: XCTestCase {

    func testLoadingFirstPage() async throws {
        let store = TestStore(initialState: SearchListReducer.State()) {
            SearchListReducer()
                .dependency(\.searchListService, .mockValue)
        }

        store.exhaustivity = .off

        let result = SearchResultAdaptor.convertSearchResult(result: try userResult(in: store.state.page))

        let userName = "jack"

        await store.send(.inputUserName(userName)) {
            $0.inputUserName = userName
        }

        await store.send(.pressSearchButton) {
            $0.searchedUserName = userName
        }

        await store.receive(.fetchUsers(.success(result))) {
            $0.isLoading = false
            $0.userItems = result.items
            $0.totalCount = 160136
        }
    }

    func testLoadMore() async throws {
        let firstPageResult = SearchResultAdaptor.convertSearchResult(result: try userResult(in: 1))
        let store = TestStore(
            initialState: SearchListReducer.State(
                userItems: firstPageResult.items,
                totalCount: 160136
            )
        ) {
            SearchListReducer()
                .dependency(\.searchListService, .mockValue)
        }

        store.exhaustivity = .off

        let userName = "jack"

        await store.send(.inputUserName(userName)) {
            $0.inputUserName = userName
        }

        await store.send(.pressSearchButton) {
            $0.searchedUserName = userName
        }

        await store.send(.loadMore) {
            $0.page = 2
        }

        let secondPageResult = SearchResultAdaptor.convertSearchResult(result: try userResult(in: 2))

        await store.receive(.fetchUsers(.success(secondPageResult))) {
            $0.isLoading = false
            $0.userItems = firstPageResult.items + secondPageResult.items
            $0.totalCount = 160143
        }
    }

    private func userResult(in page: UInt) throws -> SearchedUsersResult {
        guard let url = Bundle.main.url(forResource: "ResultPage\(page)", withExtension: "json") else {
            throw MockError.FailedToLoadJson
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(SearchedUsersResult.self, from: data)
    }
}
