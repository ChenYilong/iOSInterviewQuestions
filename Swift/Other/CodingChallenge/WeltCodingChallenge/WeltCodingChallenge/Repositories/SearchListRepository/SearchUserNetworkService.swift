//
//  SearchUserNetworkService.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation
import NetworkingProvider

struct SearchUserNetworkService: NetworkService {

    private var searchedUserRequestParameters: SearchedUserRequestParameters

    init(searchedUser: SearchedUserModel) {
        self.searchedUserRequestParameters = .init(
            q: searchedUser.userName,
            sort: searchedUser.sortType.rawValue,
            order: searchedUser.descOrder ? "desc" : "asc",
            per_page: CommonNetworkDefine.itemAmountPerPage,
            page: Int(searchedUser.page))
    }

    var baseURL: String {
        CommonNetworkDefine.baseURL
    }

    var path: String {
        "/search/users"
    }

    var method: HttpMethod {
        .get
    }

    var headers: [String : String]? {
        [HttpHeaderKey.accept: MimeType.json.rawValue]
    }

    var queryParameters: [URLQueryItem]? {
        [
            URLQueryItem(name: "q", value: searchedUserRequestParameters.q),
            URLQueryItem(name: "sort", value: searchedUserRequestParameters.sort),
            URLQueryItem(name: "order", value: searchedUserRequestParameters.order),
            URLQueryItem(name: "per_page", value: "\(searchedUserRequestParameters.per_page)"),
            URLQueryItem(name: "page", value: "\(searchedUserRequestParameters.page)")
        ]
    }

    var httpBody: Encodable? {
        nil
    }

    var timeout: TimeInterval? {
        CommonNetworkDefine.defaultTimeOut
    }
}
