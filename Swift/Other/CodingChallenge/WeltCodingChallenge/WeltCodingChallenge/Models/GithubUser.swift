//
//  GithubUser.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

/// Request: by username
struct SearchedUserRequestParameters: Encodable, Equatable {
    let q: String
    let sort: String?
    let order: String?
    let per_page: Int
    let page: Int
}

/// Response: searched user item
struct GithubUser: Decodable {
    let login: String
    let id: Int
    let node_id: String
    let avatar_url: String
    let url: String
    let html_url: String
    let repos_url: String

    enum CodingKeys: String, CodingKey {
        case login
        case id
        case node_id
        case avatar_url
        case url
        case html_url
        case repos_url
    }
}

struct SearchedUsersResult: Decodable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [GithubUser]

    enum CodingKeys: String, CodingKey {
        case total_count
        case incomplete_results
        case items
    }
}

struct UserInfo: Decodable {
    let login: String
    let id: Int
    let node_id: String
    let avatar_url: String
    let name: String?
    let public_repos: Int
    let followers: Int
    let following: Int

    enum CodingKeys: String, CodingKey {
        case login
        case id
        case node_id
        case avatar_url
        case name
        case public_repos
        case followers
        case following
    }
}
