//
//  UserDetailNetworkService.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/8.
//

import Foundation
import NetworkingProvider

struct UserDetailNetworkService: NetworkService {

    private var userName: String

    init(userName: String) {
        self.userName = userName
    }

    var baseURL: String {
        CommonNetworkDefine.baseURL
    }

    var path: String {
        "/users/\(userName)"
    }

    var method: HttpMethod {
        .get
    }

    var headers: [String : String]? {
        [HttpHeaderKey.accept: MimeType.json.rawValue]
    }

    var queryParameters: [URLQueryItem]? {
        nil
    }

    var httpBody: Encodable? {
        nil
    }

    var timeout: TimeInterval? {
        CommonNetworkDefine.defaultTimeOut
    }
}
