//
//  SearchListReducer.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import ComposableArchitecture
import Foundation

struct SearchListReducer: Reducer {

    struct State: Equatable {
        var inputUserName = ""
        var searchedUserName = ""
        var isLoading = false
        var userItems: [ResultUserItemModel] = []
        var isFailed = false
        var errorDescription = ""
        var page: UInt = 1
        var sortType: SearchedUserModel.SortType = .best_mach
        var totalCount = 0
        var showLoadMore = false
        var isDesc = true
        var showFilterSettings = false

        init(
            userItems: [ResultUserItemModel] = [],
            page: UInt = 1,
            totalCount: Int = 0
        ) {
            self.userItems = userItems
            self.page = page
            self.totalCount = totalCount
        }
    }

    enum Action: Equatable {
        case inputUserName(String)
        case pressSearchButton
        case clear
        case search
        case fetchUsers(TaskResult<SearchedResultModel>)
        case selectSortType(SearchedUserModel.SortType)
        case toggleFilterSettingsMenu
        case toggleSort
        case refresh
        case loadMore
    }

    @Dependency(\.searchListService) var searchListService

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                case .inputUserName(let name):
                    state.inputUserName = name
                    return .none

                case .pressSearchButton:
                    state.searchedUserName = state.inputUserName
                    return .send(.refresh)

                case .clear:
                    state.page = 1
                    state.totalCount = 0
                    state.userItems = []
                    state.showLoadMore = false
                    state.inputUserName = ""
                    return .none

                case .search:
                    guard !state.searchedUserName.isEmpty else {
                        state.showLoadMore = false
                        return .none
                    }

                    state.isLoading = true
                    return .run { [state = state] send in
                        let searchedUser = SearchedUserModel(
                            userName: state.searchedUserName,
                            sortType: state.sortType,
                            descOrder: state.isDesc,
                            page: state.page
                        )

                        return await send(
                            .fetchUsers(
                                TaskResult {
                                    try await searchListService.searchUserName(searchedUser)
                                }
                            )
                        )
                    }

                case let .fetchUsers(.success(result)):
                    state.isFailed = false
                    state.userItems += result.items
                    state.totalCount = result.totalCount
                    state.isLoading = false
                    state.showLoadMore = state.totalCount > state.userItems.count
                    return .none

                case let .fetchUsers(.failure(error)):
                    state.isFailed = true
                    state.errorDescription = error.localizedDescription
                    state.isLoading = false
                    return .none

                case .selectSortType(let type):
                    state.sortType = type
                    return .send(.clear)

                case .toggleFilterSettingsMenu:
                    state.showFilterSettings.toggle()
                    return .none

                case .toggleSort:
                    state.isDesc.toggle()
                    return .send(.clear)

                case .refresh:
                    state.page = 1
                    state.totalCount = 0
                    state.userItems = []
                    return .send(.search)

                case .loadMore:
                    if state.userItems.count < state.totalCount {
                        state.page += 1
                        return .send(.search)
                    }

                    return .none
            }
        }
    }
}
