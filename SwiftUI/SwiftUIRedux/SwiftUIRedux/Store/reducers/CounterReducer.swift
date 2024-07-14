//
//  CounterReducer.swift
//  SwiftUIRedux
//
//  Created by chenyilong on 2024/7/14.
//

import Foundation

func counterReducer(_ state: CounterState,_ action: Action) -> CounterState {
    var state = state
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    case _ as DecrementAction:
        state.counter -= 1
    case let action as addAction:
        state.counter += action.value
    case let action as getMoviesAction:
        state.movies = action.moveis
    default:
        break
    }
    
    return state
}
