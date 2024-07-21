//
//  ReviewListScreen.swift
//  MovieApp
//
//  Created by Yilong Chen on 3/2/24.
//

import SwiftUI

struct ReviewListScreen: View {
    
    let movie: MovieViewModel
    @State private var isPresented: Bool = false
    @StateObject private var reviewListVM = ReviewListViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Reviews")) {
                    ForEach(reviewListVM.reviews, id: \.reviewId) { review in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(review.title)
                                Text(review.text)
                                    .font(.caption)
                            }
                            Spacer()
                            Text(review.publishedDate!.asFormattedString())
                        }
                    }
                }
            }
        }
        .navigationTitle(movie.title)
        .navigationBarItems(trailing: Button("Add New Review") {
            isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            reviewListVM.getReviewsByMovie(vm: movie)
        }, content: {
            AddReviewScreen(movie: movie)
        })
        .onAppear(perform: {
            reviewListVM.getReviewsByMovie(vm: movie)
        })
    }
}

struct ReviewListScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        let movie = MovieViewModel(movie: Movie(context: CoreDataManager.shared.viewContext))
        ReviewListScreen(movie: movie).embedInNavigationView()
    }
}

