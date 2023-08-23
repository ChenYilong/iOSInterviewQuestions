//
//  UserDetailService+Dependencies.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Dependencies

extension DependencyValues {

    var userDetailService: UserDetailService {
        get { self[UserDetailService.self] }
        set { self[UserDetailService.self] = newValue }
    }
}
