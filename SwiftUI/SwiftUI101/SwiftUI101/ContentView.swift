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
    @State private var name = "[@State]Anonymous"
    @StateObject private var settings = UserSettings()
    @State var showCreateView = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                // State usage
                TextField("[@State]Enter your name", text: $name).background(Color.red)
                
                Text("Your name is \(name)")
                
                // StateObject usage
                Text("[@StateObject]Your score is \(settings.score)")
                
                Button("[@State&@StateObject]Touch to Increase Score") {
                    settings.score += 1
                    name = "[@State]chenyilong" + String(settings.score)
                }
                //                 Navigate to ChildView, passing the settings
                NavigationLink(destination: ChildView(settings: settings, name: $name, showCreateView: $showCreateView)) {
                    Text("[@Binding]Go to ChildView View")
                }
                
                
                // Display the ScoreView using @EnvironmentObject
                ScoreView()
                
                
                List {
                    //In SwiftUI, you can use a ForEach loop directly in your List.
                    //This is equivalent to numberOfRowsInSection and cellForRowAt indexPath in UIKit.
                    ForEach(0..<5) { index in
                        MyCustomCell(title: "Title \(index)", subtitle: "Subtitle \(index)", index: index)
                    }
                }
            }.toolbar {
                Button(action: {
                    showCreateView = true
                }) {
                    Label("Add Item", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showCreateView) {
                ChildView(settings: settings, name: $name, showCreateView: $showCreateView)
            }
        }
        .environmentObject(settings) // Provide UserSettings as an environment object to the other views
    }
}

struct ChildView: View {
    @ObservedObject var settings: UserSettings
    @Binding var name: String
    @Environment(\.dismiss) private var dismiss
    @Binding var showCreateView: Bool
    
    var body: some View {
        VStack {
            Text("[@Binding]Score: \(settings.score)")
            TextField("[@Binding]Change name", text: $name).background(Color.red)
            Button("[@Binding]Increase Score") {
                settings.score += 1
                name = "[@Binding]chenyilong" + String(settings.score)
            }
            Button("Dismiss") {
                showCreateView = false
                
            }
        }
    }
}

struct ScoreView: View {
    // Access UserSettings using @EnvironmentObject
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        Text("[@EnvironmentObject]Your Score in ScoreView: \(settings.score)")
            .font(.subheadline)
            .padding()
            .foregroundStyle(.red)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.green))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.red, lineWidth: 2))
    }
}

// ✅ OLD: PreviewProvider (still works)
struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// ✅ NEW: #Preview macro (Xcode 15+, recommended)
#Preview("Default State") {
    ContentView()
}

