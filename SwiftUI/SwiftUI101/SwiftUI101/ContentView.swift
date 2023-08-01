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
    @StateObject private var settings = UserSettings()
    
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
                
                // Display the ScoreView using @EnvironmentObject
                ScoreView().background(Color.green)
                
                List {
                    //In SwiftUI, you can use a ForEach loop directly in your List.
                    //This is equivalent to numberOfRowsInSection and cellForRowAt indexPath in UIKit.
                    ForEach(0..<5) { index in
                        MyCustomCell(title: "Row \(index)", subtitle: "Subtitle \(index)")
                    }
                }
            }
        }
        .environmentObject(settings) // Provide UserSettings as an environment object to the other views
    }
}

struct DetailView: View {
    var index: Int
    
    var body: some View {
        Text("Detail view for row \(index)")
    }
}

struct ChildView: View {
    @ObservedObject var settings: UserSettings
    @Binding var name: String
    @Environment(\.presentationMode) private var presentationMode
    
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

struct ScoreView: View {
    // Access UserSettings using @EnvironmentObject
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        Text("Your Score in ScoreView: \(settings.score)")
    }
}
