//
//  ContentView.swift
//  SwiftUI101
//
//  Created by chenyilong on 2023/8/1.
//

import SwiftUI

// Observable object to be used
class UserSettings: ObservableObject {
    @Published var score = 0
}

struct ContentView: View {
    @State private var name = "Anonymous"
    @StateObject var settings = UserSettings()

    var body: some View {
        NavigationView {
            
            VStack {
                // State usage
                TextField("Enter your name", text: $name).background(Color.red)
                
                Text("Your name is \(name)")
                
                // StateObject usage
                Text("Your score is \(settings.score)")
                Button("Increase Score") {
                    settings.score += 1
                    name = "chenyilong" + String(settings.score)
                    
                }
                
                // Navigate to ChildView, passing the settings
                NavigationLink(destination: ChildView(settings: settings, name: $name)) {
                    Text("Go to Second View")
                }
            }
        }
    }
}

struct ChildView: View {
    @ObservedObject var settings: UserSettings
    @Binding var name: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Score: \(settings.score)")
            TextField("Change name", text: $name).background(Color.red)
            Button("Increase Score") {
                settings.score += 1
            }
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}


