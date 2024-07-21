//
//  MovieListScreen.swift
//  MovieApp
//
//  Created by Yilong Chen on 2/24/24.
//

import SwiftUI

struct MovieListScreen: View {
    
    @StateObject private var movieListVM = MovieListViewModel()
    @State private var isPresented: Bool = false
    
    private func deleteMovie(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let movie = movieListVM.movies[index]
            // delete the movie
            movieListVM.deleteMovie(movie: movie)
            // get all movies
            movieListVM.getAllMovies()
        }
    }
    
    var body: some View {
        List {
            
            ForEach(movieListVM.movies, id: \.movieId) { movie in
                NavigationLink(
                    destination: MovieDetailScreen(movie: movie),
                    label: {
                        MovieCell(movie: movie)
                    })
            }.onDelete(perform: deleteMovie)
            
        }.listStyle(PlainListStyle())
        
        .navigationTitle("Movies")
        .navigationBarItems(trailing: Button("Add Movie") {
            isPresented = true 
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            movieListVM.getAllMovies()
        },  content: {
            AddMovieScreen()
        })
        .embedInNavigationView()
        
        .onAppear(perform: {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().separatorColor = .clear
            movieListVM.getAllMovies()
        })
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieListScreen()
        }
    }
}

struct MovieCell: View {
    
    let movie: MovieViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .fontWeight(.bold)
                    .font(.system(size: 22))
                Text(movie.director)
                    .font(.callout)
                    .opacity(0.5)
                Spacer()
                
            }
            Spacer()
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(movie.rating!)")
            }
        }
        .padding()
        .foregroundColor(Color.black)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9567790627, green: 0.9569163918, blue: 0.9567491412, alpha: 1)), Color(#colorLiteral(red: 0.9685427547, green: 0.9686816335, blue: 0.9685124755, alpha: 1))]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
    }
}
