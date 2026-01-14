//
//  ContentView.swift
//  SwiftUI101
//
//  Created by chenyilong on 2023/8/1.
//

import SwiftUI
import Observation

// Observable object to be used
/*option 2(>iOS17)*/
@Observable class UserSettingsiOS17ViewModel {
    //    /*option 1(<iOS17)*/ @Published var score = 0
    //    /*option 1(<iOS17)*/  @Published var data1 = "hello world"
    //    /*option 1(<iOS17)*/ @Published var data2 = "we love programming!"
    
    /*option 2(>iOS17)*/ var score = 0
    /*option 2(>iOS17)*/ var data1 = "hello world"
    /*option 2(>iOS17)*/ var data2 = "we love programming!"
    
}
struct OtheriOS17ChildView: View {
    //    /*option 1(<iOS17)*/ @ObservedObject var settings = UserSettingsViewModel()
    /*option 2(>iOS17) */ @State private var settings = UserSettingsiOS17ViewModel()
    
    var body: some View {
        
        VStack  {
            Text("child data:")
            
            Text("\(settings.data1)")
            Text("\(settings.data2)")
            Button("update child data") {
                if settings.data1 == "hello world" {
                    settings.data1 = "chagne"
                    settings.data2 = "try again"
                } else {
                    settings.data1 = "hello world"
                    settings.data2 = "we love programming!"
                }
            }
            
        }.background(Color(UIColor(red: CGFloat(Int.random(in: 0...255)) / 255,
                                   green: CGFloat(Int.random(in: 0...255)) / 255,
                                   blue: CGFloat(Int.random(in: 0...255)) / 255,
                                   alpha: 1)))
    }
}

struct OtheriOS17ParentView: View {
    //number is specific and internal to a single class, declare  number as static  at the top of the file
    @State private var number: Int = 0
    var body: some View {
        VStack {
            Text("parent data\(number)")
            Button("update parent data") {
                number += 1
            }
            OtheriOS17ChildView()
        }.background(Color(UIColor(red: CGFloat(Int.random(in: 0...255)) / 255,
                                   green: CGFloat(Int.random(in: 0...255)) / 255,
                                   blue: CGFloat(Int.random(in: 0...255)) / 255,
                                   alpha: 1)))
    }
}

struct iOS17ContentView: View {
    @State private var name = "[@State]Anonymous"
    @State var settings = UserSettingsiOS17ViewModel()
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
                NavigationLink(destination: iOS17ChildView(settings: settings, name: $name, showCreateView: $showCreateView)) {
                    Text("[@Binding]Go to ChildView View")
                }
                
                
                // Display the ScoreView using @EnvironmentObject
                iOS17ScoreView().environment(settings)
                OtherParentView()
                
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
                iOS17ChildView(settings: settings, name: $name, showCreateView: $showCreateView)
            }
        }
        .environment(settings) // Provide UserSettings as an environment object to the other views
    }
}

struct iOS17ChildView: View {
    /*@Bindable*/ var settings: UserSettingsiOS17ViewModel
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

struct iOS17ScoreView: View {
    // Access UserSettings using @EnvironmentObject
    @Environment(UserSettingsiOS17ViewModel.self) var settings
    
    var body: some View {
        Text("[@EnvironmentObject]Your Score in ScoreView: \(settings.score)")
            .font(.subheadline)
            .padding()
            .foregroundStyle(.red)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.green))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.red, lineWidth: 2))
    }
}


// ✅ FIXED: Previews with proper environment setup
#Preview("Default State") {
    @Previewable @State var settings = UserSettingsiOS17ViewModel()
    
    return iOS17ContentView(settings: settings)
        .environment(settings)
}

#Preview("With Score") {
    @Previewable @State var settings = UserSettingsiOS17ViewModel()
    
    let _ = { settings.score = 10 }()
    
    return iOS17ContentView(settings: settings)
        .environment(settings)
}

#Preview("Dark Mode") {
    @Previewable @State var settings = UserSettingsiOS17ViewModel()
    
    return iOS17ContentView(settings: settings)
        .environment(settings)
        .preferredColorScheme(.dark)
}

#Preview("Child View") {
    @Previewable @State var settings = UserSettingsiOS17ViewModel()
    @Previewable @State var name = "Test User"
    @Previewable @State var showCreateView = false
    
    return iOS17ChildView(settings: settings, name: $name, showCreateView: $showCreateView)
}


// ✅ ALSO CORRECT - Use return ONLY if single expression
#Preview("Score View") {
    @Previewable @State var settings = UserSettingsiOS17ViewModel()
    let _ = { settings.score = 42 }()
    
    iOS17ScoreView()
        .environment(settings)
}

#Preview("Parent View") {
    OtheriOS17ParentView()
}
