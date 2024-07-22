//
//  MoviesMiddleware.swift
//  ReduxAsync
//
//  Created by chenyilong on 2024/7/21.
//

import Foundation

// Middlewares
func moviesMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        
        switch action {
            case let action as FetchMoviesAction:
            Webservice().getMoviesBySearch(search: action.search.urlEncode()) { result in
                    switch result {
                        case .success(let movies):
                        if let movies = movies {
                            print(movies)
                            dispatch(SetMoviesAction(movies: movies))
                        }
                            
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }
            case let action as FetchMovieDetailAction:
                Webservice().getMovieDetailsById(id: action.imdbId) { result in
                    switch result {
                        case .success(let movieDetail):
                        if let movieDetail = movieDetail {
                            dispatch(SetMovieDetailAction(movieDetail: movieDetail))
                        }
                            
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }
            default:
                break
        }
        
    }
    
}
