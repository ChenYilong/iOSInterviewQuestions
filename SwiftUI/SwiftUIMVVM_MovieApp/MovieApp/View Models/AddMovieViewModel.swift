//
//  AddMovieViewModel.swift
//  MovieApp
//
//  Created by Yilong Chen on 2/26/24.
//

import Foundation

class AddMovieViewModel: ObservableObject {
    
    var title: String = ""
    var director: String = ""
    @Published var rating: Int? = nil
    var releaseDate: Date = Date()
    
    func save() {
        
        let movie = Movie(context: Movie.viewContext)
        movie.title = title
        movie.director = director
        movie.rating = Double(rating ?? 0)
        movie.releaseDate = releaseDate
        
        try? movie.save() 
    }
    
}
