//
//  Store.swift
//  HelloRedux
//
//  Created by Yilong Chen on 9/14/24.
//

import Foundation

typealias Dispatcher = (Action) -> Void

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

protocol ReduxState { }

struct AppState: ReduxState {
    var moviesState = MoviesState()
}

struct MoviesState: ReduxState {
    var movies: [Movie] = [Movie]()
    var selectedMovieDetail: MovieDetail?
}

protocol Action { }

struct FetchMoviesAction: Action {
    let search: String
}

struct SetMoviesAction: Action {
    let movies: [Movie]
}

struct FetchMovieDetailAction: Action {
    let imdbId: String
}

struct SetMovieDetailAction: Action {
    let movieDetail: MovieDetail
}

class Store<StoreState: ReduxState>: ObservableObject {
    
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    var middlewares: [Middleware<StoreState>]
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState
         , middlewares: [Middleware<StoreState>] = []
    ) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        // run all the middlewares
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
    
}
