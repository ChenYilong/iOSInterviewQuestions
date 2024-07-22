//
//  Actions.swift
//  RestRoomFinder
//
//  Created by Yilong Chen on 10/15/24.
//

import Foundation

protocol Action { }

struct FetchRestroomsAction: Action {
    let latitude: Double
    let longitude: Double
}

struct SetRestroomsAction: Action {
    let restrooms: [Restroom]
}
