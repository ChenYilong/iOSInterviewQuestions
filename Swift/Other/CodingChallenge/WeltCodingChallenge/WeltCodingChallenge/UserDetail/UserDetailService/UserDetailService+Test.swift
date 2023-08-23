//
//  UserDetailService+Test.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Dependencies
import Foundation

extension UserDetailService: TestDependencyKey {
    static var testValue = Self(
        loadUserDetail: unimplemented("\(Self.self).loadUserDetail")
    )
}

extension UserDetailService {
    static var mockValue = Self(
        loadUserDetail: { _ in
            guard let url = Bundle.main.url(forResource: "UserDetail", withExtension: "json") else {
                throw MockError.FailedToLoadJson
            }

            let data = try Data(contentsOf: url)
            let userInfo = try JSONDecoder().decode(UserInfo.self, from: data)
            return UserDetailAdaptor.convent(userInfo: userInfo)
        }
    )
}
