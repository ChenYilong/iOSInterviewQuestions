//
//  AddActorScreen.swift
//  MovieApp
//
//  Created by Yilong Chen on 3/11/24.
//

import SwiftUI

struct AddActorScreen: View {
    
    let movie: MovieViewModel
    @StateObject private var addActorVM = AddActorViewModel()
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        
            Form {
                VStack(alignment: .leading) {
                    Text("Add Actor")
                        .font(.largeTitle)
                    Text(movie.title)
                }.padding(.bottom, 50)
                TextField("Enter name", text: $addActorVM.name)
                HStack {
                    Spacer()
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                    Button("Save") {
                        addActorVM.addActorToMovie(movieId: movie.movieId)
                        presentationMode.wrappedValue.dismiss()
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
    }
}

struct AddActorScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddActorScreen(movie: MovieViewModel(movie: Movie(context: Movie.viewContext)))
    }
}
