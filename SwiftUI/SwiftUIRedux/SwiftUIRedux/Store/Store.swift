//
//  Store.swift
//  SwiftUIRedux
//
//  Created by chenyilong on 2024/7/14.
//

import Foundation

/*!
 * Generics in Swift and Dependency Injection are closely related when it comes to implementing the Dependency Inversion Principle (DIP). Generics provide the necessary abstraction to decouple high-level modules from low-level modules, while dependency injection ensures that dependencies are injected from the outside, promoting modularity and testability. In the provided `Store` class example, generics and constructor injection work together to create a flexible, reusable, and decoupled state management system.
 */
typealias Dispatcher = (Action) -> Void
typealias Reducer<State: ReduxState> = (_ state: State,_ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

protocol ReduxState { }

struct AppState: ReduxState {
    var counterState = CounterState()
    var taskState = TaskState()
}

struct CounterState: ReduxState {
    var counter: Int = 0
    var movies = [String]()
}

struct TaskState: ReduxState {
    var tasks: [Task] = [Task]()
}

protocol Action { }

struct IncrementAction: Action { }
struct DecrementAction: Action { }
struct IncrementActionAsync: Action { }

struct getMoviesAction: Action {
    let moveis: [String]
}

struct addAction: Action {
    var value: Int
}

struct AddTaskAction: Action {
    var task: Task
}

class Store<StoreState: ReduxState>: ObservableObject {
    
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    var middlewares: [Middleware<StoreState>] = []
    
    init(reducer:@escaping Reducer<StoreState>, state: StoreState, middlewares: [Middleware<StoreState>] = []) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
            print("reducer update state")
        }
        
        middlewares.forEach { middleware in
            print("middlewares.forEach")
            middleware(state, action, self.dispatch)
        }
    }
}
