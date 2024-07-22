//
//  RestroomReducer.swift
//  RestRoomFinder
//
//  Created by Yilong Chen on 09/06/2024.
//

import Foundation

func restroomsReducer(
    _ state: RestRoomState,
    _ action: Action
) -> RestRoomState {
    var state = state
    switch action {
    case let action as SetRestroomsAction:
        state.restrooms = action.restrooms
    default:
        break
    }
    return state
}
