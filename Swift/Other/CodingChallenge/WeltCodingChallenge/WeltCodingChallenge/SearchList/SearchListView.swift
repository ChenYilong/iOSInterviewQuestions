//
//  ContentView.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import CachableAsyncImage
import ComposableArchitecture
import SwiftUI

struct SearchListView: View {

    @Environment(\.imageCache) private var cache: ImageCache
    @Environment(\.context) private var context
    let store: StoreOf<SearchListReducer>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationStack {
                Group {
                    switch(viewStore.userItems.count == 0, viewStore.isLoading, viewStore.isFailed) {
                        case (true, true, false):
                            ProgressView()
                                .progressViewStyle(.circular)
                                .controlSize(.large)

                        case (true, false, true):
                            VStack {
                                Text("Failed: \(viewStore.errorDescription)")
                                Button("Try Again") {
                                    viewStore.send(.refresh)
                                }
                            }

                        case (true, false, false):
                            Text("Search Github Users")

                        default:
                            VStack {
                                sortingMenu
                                    .frame(height: viewStore.showFilterSettings ? SizeDefine.sortMenuHeight : 0)
                                    .opacity(viewStore.showFilterSettings ? 1 : 0)
                                    .rotation3DEffect(
                                        .degrees(viewStore.showFilterSettings ? 0 : -90),
                                        axis: (1.0, 0.0, 0.0),
                                        anchor: .init(x: 0.5, y: 0),
                                        perspective: 0.3
                                    )
                                    .animation(.easeInOut, value: viewStore.showFilterSettings)

                                List {
                                    ForEach(viewStore.userItems, id: \.self) { user in
                                        NavigationLink(destination: {
                                            UserDetailView(
                                                store: Store(initialState: UserDetailReducer.State(userName: user.userName)) {
                                                    UserDetailReducer()
                                                        .dependency(\.userDetailService, .liveValue(context: context))
                                                }
                                            )
                                        }) {
                                            HStack {
                                                CAsyncImage(
                                                    url: URL(string: user.avatarURL)!,
                                                    cache: cache
                                                ) {
                                                    $0.resizable()
                                                }
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: SizeDefine.itemAvatarSize, height: SizeDefine.itemAvatarSize)

                                                Text(user.userName)
                                            }
                                        }
                                    }

                                    loadMoreItem
                                }
                                .refreshable {
                                    viewStore.send(.refresh)
                                }
                            }
                            .toolbar {
                                Button("Filter") {
                                    viewStore.send(.toggleFilterSettingsMenu)
                                }
                            }
                    }
                }
                .navigationTitle("Github Users")
            }
            .searchable(
                text: viewStore.binding(
                    get: { $0.inputUserName },
                    send: { .inputUserName($0) }
                )
            )
            .onSubmit(of: .search) {
                viewStore.send(.pressSearchButton)
            }
        }
    }

    private var loadMoreItem: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            HStack(spacing: 10) {
                Spacer()
                Text("Load More...")
                    .onAppear{
                        viewStore.send(.loadMore)
                    }
                ProgressView()
                    .progressViewStyle(.circular)
                    .isHidden(!viewStore.isLoading, remove: true)
                Spacer()
            }
            .isHidden(!viewStore.showLoadMore, remove: true)
        }
    }

    private var sortingMenu: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("Sort by:")
                    .padding(SizeDefine.smallInnerPadding)
                    .frame(height: SizeDefine.sortMenuTipHeight)
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(SearchedUserModel.SortType.allCases, id:\.self) { type in

                                Button(action: { viewStore.send(.selectSortType(type)) }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: SizeDefine.smallCornerRadius)
                                            .foregroundColor(viewStore.sortType == type ? .blue : .mint)
                                        
                                        Text(type.rawValue)
                                            .foregroundColor(viewStore.sortType == type ? .mint : .blue)
                                            .fontWeight(.bold)
                                            .padding(.horizontal, SizeDefine.smallInnerPadding)
                                        
                                    }
                                    .padding(SizeDefine.tinyInnerPadding)
                                }
                                .padding(.vertical, SizeDefine.smallInnerPadding)
                            }
                        }
                    }

                    Button(action: { viewStore.send(.toggleSort) }) {
                        Image(
                            systemName: viewStore.isDesc
                            ? ImageName.arrowDown
                            : ImageName.arrowUp
                        )
                        .resizable()
                        .scaledToFit()
                        .frame(width: SizeDefine.orderButtonSize, height: SizeDefine.orderButtonSize)
                    }
                }
            }
            .padding(.horizontal, SizeDefine.innerPadding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView(
            store: Store(initialState: SearchListReducer.State()) {
                SearchListReducer()
                    .dependency(\.searchListService, .mockValue)
            }
        )
    }
}
