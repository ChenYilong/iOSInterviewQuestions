//
//  Store.swift
//  SwiftUIRedux
//
//  Created by chenyilong on 2024/7/14.
//

import Foundation
typealias Reducer<State: ReduxState> = (_ state: State,_ action: Action) -> State

protocol ReduxState { }

struct AppState: ReduxState {
    var counterState = CounterState()
}

struct CounterState: ReduxState {
    var counter: Int = 0
    var movies = [String]()
}

protocol Action { }

struct IncrementAction: Action { }
struct DecrementAction: Action { }
struct getMoviesAction: Action {
    let moveis: [String]
}

struct addAction: Action {
    var value: Int
}

class Store<StoreState: ReduxState>: ObservableObject {
    
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    
    init(reducer:@escaping Reducer<StoreState>, state: StoreState) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
