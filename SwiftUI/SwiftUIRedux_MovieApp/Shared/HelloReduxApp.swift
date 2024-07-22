//
//  HelloReduxApp.swift
//  Shared
//
//  Created by Yilong Chen on 9/14/24.
//

import SwiftUI

@main
struct HelloReduxApp: App {
    var body: some Scene {
       
        let store = Store(reducer: appReducer, state: AppState(),
                          middlewares: [moviesMiddleware()])
        
        WindowGroup {
            MovieDetailsView(movie:
                                Movie(title: "Batman: The Killing Joke", imdbId: "tt4853102", poster: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg")).environmentObject(store)
        }
    }
}
