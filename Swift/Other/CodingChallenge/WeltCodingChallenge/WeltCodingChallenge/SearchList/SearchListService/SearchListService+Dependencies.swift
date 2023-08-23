//
//  SearchListService+Dependencies.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/7.
//

import Dependencies

extension DependencyValues {

    var searchListService: SearchListService {
        get { self[SearchListService.self] }
        set { self[SearchListService.self] = newValue }
    }
}
