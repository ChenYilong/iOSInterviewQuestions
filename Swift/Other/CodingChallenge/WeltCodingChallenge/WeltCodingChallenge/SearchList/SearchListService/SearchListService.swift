//
//  SearchListService.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

struct SearchListService {

    var searchUserName: @Sendable (SearchedUserModel) async throws -> SearchedResultModel
}
