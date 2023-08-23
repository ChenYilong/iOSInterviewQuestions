//
//  UserDetailReducer.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import ComposableArchitecture
import Foundation

struct UserDetailReducer: Reducer {
    
    struct State: Equatable {
        var userName: String
        var userDetail: UserDetailModel?
        var isLoading = true
        var isFailed = false
        var errorDescription = ""

        init(userName: String, userDetail: UserDetailModel? = nil) {
            self.userName = userName
            self.userDetail = userDetail
        }
    }

    enum Action: Equatable {
        case load
        case fetchUserDetail(TaskResult<UserDetailModel>)
    }

    @Dependency(\.userDetailService) var userDetailService

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                case .load:
                    state.isLoading = true
                    return .run { [state = state] send in
                        return await send(
                            .fetchUserDetail(
                                TaskResult {
                                    try await userDetailService.loadUserDetail(state.userName)
                                }
                            )
                        )
                    }

                case let .fetchUserDetail(.success(userDetail)):
                    state.isLoading = false
                    state.userDetail = userDetail
                    state.isFailed = false
                    return .none

                case let .fetchUserDetail(.failure(error)):
                    state.isLoading = false
                    state.isFailed = true
                    state.errorDescription = error.localizedDescription
                    return .none
            }
        }
    }
}
