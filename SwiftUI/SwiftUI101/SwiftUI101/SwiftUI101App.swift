//
//  SwiftUI101App.swift
//  SwiftUI101
//
//  Created by chenyilong on 2023/8/1.
//

import SwiftUI

@main
struct MyApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct Previews_SwiftUI101App_Previews: PreviewProvider {
    static var previews: some View {
        Image("iteatime").resizable()

        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
