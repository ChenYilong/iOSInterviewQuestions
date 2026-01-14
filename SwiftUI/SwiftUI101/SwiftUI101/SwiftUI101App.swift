//
//  SwiftUI101App.swift
//  SwiftUI101
//
//  Created by chenyilong on 2023/8/1.
//

import SwiftUI

@main
struct MyApp: App {
    @StateObject private var settings = UserSettingsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(settings: settings)
                .environmentObject(settings)
        }
    }
}

struct Previews_SwiftUI101App_Previews: PreviewProvider {
    static var previews: some View {
        Image("iteatime").resizable()

        Text("Hello, World!")
    }
}
