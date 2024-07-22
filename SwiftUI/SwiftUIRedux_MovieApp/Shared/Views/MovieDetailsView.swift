//
//  MovieDetailsView.swift
//  ReduxAsync
//
//  Created by chenyilong on 2024/7/21.
//

import SwiftUI

struct MovieDetailsView: View {
    @EnvironmentObject var store: Store<AppState>
    
    let movie: Movie
    struct Props {
        let movieDetail: MovieDetail?
        let onLoadMovieDetail: (String) -> Void
    }
    
    private func map(state: MoviesState, dispatch: @escaping Dispatcher) -> Props {
        Props(movieDetail: state.selectedMovieDetail, onLoadMovieDetail: { imdbId in
            dispatch(FetchMovieDetailAction(imdbId: imdbId))
        })
    }
    
    var body: some View {
        VStack {
            let props = map(state: store.state.moviesState, dispatch: store.dispatch)
            
            Group {
                if let movieDetail = props.movieDetail {
                    VStack{
                        HStack {
                            Spacer()
                            URLImage(url: movieDetail.poster)
                            Spacer()
                        }
                        Text(movieDetail.title).padding().font(.title)
                        Text(movieDetail.plot).padding()
                        HStack {
                            Text("Rating")
                            RatingView(rating: .constant(movieDetail.imdbRating.toInt()))
                            Spacer()
                        }
                    }


                } else {
                    Button("Load Movie Detail") {
                        props.onLoadMovieDetail(movie.imdbId)
                    }
                }
            }
            .onAppear(perform: {
                props.onLoadMovieDetail(movie.imdbId)
            })
        }
        
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(reducer: appReducer, state: AppState(),
                          middlewares: [moviesMiddleware()])
        
        MovieDetailsView(movie:
                            Movie(title: "Batman: The Killing Joke", imdbId: "tt4853102", poster: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg")
        ).environmentObject(store)
    }
}
