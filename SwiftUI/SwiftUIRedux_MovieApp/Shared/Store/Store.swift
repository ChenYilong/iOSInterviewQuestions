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

// Middlewares
func moviesMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        
        switch action {
            case _ as FetchMoviesAction:
                Webservice().getAllMovies(url: Constants.Url.moviesURL) { result in
                    
                    switch result {
                        case .success(let movies):
                            print(movies)
                            dispatch(SetMoviesAction(movies: movies))
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }
            default:
                break
        }
        
    }
    
}


protocol ReduxState { }

struct AppState: ReduxState {
    var moviesState = MoviesState()
}

struct MoviesState: ReduxState {
    var movies: [Movie] = [Movie]()
}

protocol Action { }

struct FetchMoviesAction: Action {
}

struct SetMoviesAction: Action {
    let movies: [Movie]
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
