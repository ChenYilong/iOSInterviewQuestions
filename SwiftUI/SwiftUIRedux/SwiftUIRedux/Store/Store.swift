//
//  Store.swift
//  SwiftUIRedux
//
//  Created by chenyilong on 2024/7/14.
//

import Foundation
typealias Reducer = (_ state: State,_ action: Action) -> State
struct State {
    var counter: Int = 0
}

protocol Action { }

struct IncrementAction: Action { }
struct DecrementAction: Action { }

struct addAction: Action {
    var value: Int
}
func reducer(_ state: State,_ action: Action) -> State {
    var state = state
    switch action {
        case _ as IncrementAction:
            state.counter += 1
        case _ as DecrementAction:
            state.counter -= 1
        case let action as addAction:
            state.counter += action.value
        default:
            break
    }
    
    return state
}

class Store: ObservableObject {
    var reducer: Reducer
    @Published var state: State
    
    init(reducer:@escaping Reducer, state: State = State()) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
