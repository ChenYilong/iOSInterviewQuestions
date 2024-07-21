//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Yilong Chen on 2/23/24.
//

import SwiftUI

@main
struct MovieAppApp: App {
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some Scene {
        WindowGroup {
            MovieListScreen()
        }
    }
}
