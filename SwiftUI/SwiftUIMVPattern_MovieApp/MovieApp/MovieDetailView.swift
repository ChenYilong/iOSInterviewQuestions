//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Yilong Chen on 8/8/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    @StateObject private var store = Store()
    let movie: Movie
    
    var body: some View {
        List {
            if let movieDetail = store.movieDetail {
                AsyncImage(url: movieDetail.poster)
                Text(movieDetail.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                if !store.newsArticles.isEmpty {
                    ForEach(store.newsArticles) { article in
                        Text(article.title)
                    }
                } else {
                    Text("No articles found.")
                }
                
            }
        }.task {
            do {
                try await store.fetchMovieById(movie.id)
                try await store.fetchArticlesByKeyword(movie.title)
            } catch {
                print(error)
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.preview)
    }
}
