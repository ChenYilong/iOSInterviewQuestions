//
//  ContentView.swift
//  Shared
//
//  Created by Yilong Chen on 9/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        let movies: [Movie]
        let onMoviesFetch: () -> Void
    }
    
    func map(state: AppState, dispatch: @escaping Dispatcher) -> Props {
        Props(movies: state.moviesState.movies, onMoviesFetch: {
            dispatch(FetchMoviesAction())
        })
    }
    
    var body: some View {
        
        let props = map(state: store.state, dispatch: store.dispatch)
        
        VStack {
            List(props.movies, id: \.imdbId) { movie in
                HStack {
                    URLImage(url: movie.poster)
                        .frame(width: 100, height: 100)
                    Text(movie.title)
                }
            }
            
            .onAppear(perform: {
                props.onMoviesFetch()
            })
            
        }.navigationTitle("Movies").embedInNavigationView()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(reducer: appReducer, state: AppState(),
                          middlewares: [moviesMiddleware()])
        return ContentView().environmentObject(store)
    }
}
