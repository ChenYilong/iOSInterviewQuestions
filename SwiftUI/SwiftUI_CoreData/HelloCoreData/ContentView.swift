//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Yilong Chen on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    @State private var movieName: String = ""
    @State private var movies: [Movie] = [Movie]()
    
    private func populateMovies() {
        movies = coreDM.getAllMovies()
    }
    
    var body: some View {
        VStack {
            TextField("Enter movie name", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save") {
                coreDM.saveMovie(name: movieName)
            }
            
            List(movies, id: \.self) { movie in
                Text(movie.title!)
            }.listStyle(PlainListStyle())
            
            Spacer()
            
        }.padding()
        .onAppear(perform: {
            populateMovies()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
