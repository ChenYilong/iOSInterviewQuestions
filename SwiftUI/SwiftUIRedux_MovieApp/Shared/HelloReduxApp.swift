//
//  HelloReduxApp.swift
//  Shared
//
//  Created by Yilong Chen on 9/14/24.
//

import SwiftUI

@main
struct HelloReduxApp: App {
    var body: some Scene {
        
        let store = Store(reducer: appReducer, state: AppState(),
                          middlewares: [moviesMiddleware()])
        
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
