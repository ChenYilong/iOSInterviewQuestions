//
//  MoviesReducer.swift
//  ReduxAsync
//
//  Created by Yilong Chen on 9/21/24.
//

import Foundation

func moviesReducer(state: MoviesState, action: Action) -> MoviesState {
    
    var state = state
    
    switch action {
        case let action as SetMoviesAction:
            state.movies = action.movies
        case let action as SetMovieDetailAction:
            state.selectedMovieDetail = action.movieDetail
        default:
            break 
    }
    
    return state
}
