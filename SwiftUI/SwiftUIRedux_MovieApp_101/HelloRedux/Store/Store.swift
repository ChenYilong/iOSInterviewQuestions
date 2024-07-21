//
//  Store.swift
//  HelloRedux
//
//  Created by Yilong Chen on 9/9/24.
//  Copyright © 2024 Yilong Chen. All rights reserved.
//

import Foundation

typealias Reducer = (State, Action) -> State

struct State {
    var counter = 0
    var movies = [Movie]()
}

protocol Action { }

struct IncrementAction: Action { }

struct GetMoviesAction: Action {
    
    init() {
        
        MovieService().getMovies(url: Constants.MOVIES_URL) { result in
            switch result {
                case .success(let movies):
                    store.dispatch(action: SetMoviesAction(movies: movies))
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
}

struct SetMoviesAction: Action {
    let movies: [Movie]
    
    init(movies: [Movie]) {
        self.movies = movies
    }
}



func reducer(state: State, action: Action) -> State {
    var state = state
    
    switch action {
        case _ as IncrementAction:
            state.counter += 1
        case let action as SetMoviesAction:
            state.movies = action.movies 
            
        default:
            break
    }
    
    return state
}

class Store: ObservableObject {
    
    var reducer: Reducer
    @Published private (set) var state: State
    
    init(reducer: @escaping Reducer, state: State = State()) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
    }
    
}
