//
//  UserDetailView.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import CachableAsyncImage
import ComposableArchitecture
import SwiftUI

struct UserDetailView: View {

    @Environment(\.imageCache) private var cache: ImageCache
    let store: StoreOf<UserDetailReducer>

    var body: some View {
        WithViewStore(store, observe:{ $0 }) { viewStore in
            VStack(alignment: .leading) {
                if viewStore.isFailed {
                    Text("Failed: \(viewStore.errorDescription)")
                } else {
                    HStack {
                        if let userDetail = viewStore.userDetail {
                            CAsyncImage(
                                url: URL(string: userDetail.avatarURL)!,
                                cache: cache
                            ) {
                                $0.resizable()
                            }
                            .aspectRatio(contentMode: .fit)
                            .frame(width: SizeDefine.userInfoAvatarSize, height: SizeDefine.userInfoAvatarSize)

                            VStack(alignment: .leading) {
                                Text("Public Repos: \(userDetail.publicRepositoryCount)")
                                Text("Followers: \(userDetail.followersCount)")
                                Text("Following: \(userDetail.followingCount)")
                            }
                            .padding(.leading, SizeDefine.detailSpacing)
                        } else {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .controlSize(.large)
                        }
                    }
                }

                Spacer()
            }
            .toolbar {
                Button(action: {
                    viewStore.send(.load)
                }) {
                    Image(systemName: ImageName.arrowClockwise)
                }
            }
            .navigationTitle(viewStore.userName)
            .task {
                viewStore.send(.load)
            }
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(
            store: Store(initialState: UserDetailReducer.State(userName: "jack")) {
                UserDetailReducer()
                    .dependency(\.userDetailService, .mockValue)
            }
        )
    }
}
