//
//  UserDetailTests.swift
//  WeltCodingChallengeTests
//
//  Created by Jacklandrin on 2023/8/7.
//

import ComposableArchitecture
import XCTest

@MainActor
final class UserDetailTests: XCTestCase {

    func testLoadUserDetail() async throws {
        let store = TestStore(initialState: UserDetailReducer.State(userName: "jack")) {
            UserDetailReducer()
                .dependency(\.userDetailService, .mockValue)
        }

        store.exhaustivity = .off

        let userDetail = UserDetailAdaptor.convent(userInfo: try userInfo())

        await store.send(.load) {
            $0.isLoading = true
        }

        await store.receive(.fetchUserDetail(.success(userDetail))) {
            $0.userDetail = userDetail
        }
    }

    private func userInfo() throws -> UserInfo {
        guard let url = Bundle.main.url(forResource: "UserDetail", withExtension: "json") else {
            throw MockError.FailedToLoadJson
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(UserInfo.self, from: data)
    }
}
