//
//  SwiftUIReduxApp.swift
//  SwiftUIRedux
//
//  Created by chenyilong on 2024/7/14.
//

import SwiftUI

@main
struct SwiftUIReduxApp: App {
    var body: some Scene {
        let store = Store(reducer: reducer, state: State())
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
