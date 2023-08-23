//
//  CommonClient.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Foundation

enum CommonNetworkDefine {
    static var baseURL: String {
        "https://api.github.com"
    }

    static var itemAmountPerPage: Int {
        30
    }

    static var defaultTimeOut: TimeInterval {
        30
    }
}
