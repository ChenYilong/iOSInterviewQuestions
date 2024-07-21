//
//  ContentView.swift
//  MovieApp
//
//  Created by Yilong Chen on 8/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var store = Store()
    
    private func populateMovies() async {
        do {
            try await store.fetchMovies()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        
        NavigationStack {
            List(store.movies) { movie in
                NavigationLink(value: movie) {
                    HStack {
                        AsyncImage(url: movie.poster) { image in
                            image.resizable()
                                .frame(width: 75, height: 75)
                        } placeholder: {
                            ProgressView()
                        }
                        Text(movie.title)
                    }
                }
                
            }.navigationDestination(for: Movie.self, destination: { movie in
                MovieDetailView(movie: movie)
            })
        }
        
        .task {
            await populateMovies()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
