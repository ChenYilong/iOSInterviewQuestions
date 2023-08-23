//
//  WeltCodingChallengeApp.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import ComposableArchitecture
import SwiftUI

@main
struct WeltCodingChallengeApp: App {

    @Environment(\.context) private var context

    var body: some Scene {
        WindowGroup {
            SearchListView(
                store: Store(initialState: SearchListReducer.State()) {
                    SearchListReducer()
                        .dependency(\.searchListService, .liveValue(context: context))
                        ._printChanges()
                }
            )
            .task {
                registerRepositories()
            }
        }
    }

    private func registerRepositories() {
        context.register(SearchListRepoProtocol.self, repo: SearchListRepository())
        context.register(UserDetailRepoProtocol.self, repo: UserDetailRepository())
    }
}
