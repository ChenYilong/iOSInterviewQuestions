//
//  SearchedUser.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

struct SearchedUserModel: Equatable {
    var userName: String
    var sortType: SortType
    var descOrder: Bool
    var page: UInt

    enum SortType: String, Equatable, CaseIterable {
        case best_mach
        case followers
        case repositories
        case joined
    }
}

struct SearchedResultModel: Equatable {
    let totalCount: Int
    let items: [ResultUserItemModel]
}

struct ResultUserItemModel: Equatable, Hashable {
    let userName: String
    let avatarURL: String
    let userInfoURL: String
}
