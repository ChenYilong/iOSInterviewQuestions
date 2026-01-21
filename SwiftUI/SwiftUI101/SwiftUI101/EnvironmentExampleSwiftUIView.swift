//
//  EnvironmentExampleSwiftUIView.swift
//  SwiftUI101
//
//  Created by chenyilong on 2026/1/21.
//

import SwiftUI
import Observation

@Observable
class PersonViewModel {
    
    var firstName: String = "Yilong"
    var lastName: String = "Chen"
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    func changePerson() {
        let names: [(String, String)] = [
            ("Elon", "Chan"),
            ("Elmo", "Lee"),
            ("Cookie", "Monster"),
            ("Oscar", "the Grouch"),
            ("Bert", ""),
            ("Ernie", "")
        ]
        
        let randomName = names.randomElement() ?? ("", "")
        firstName = randomName.0
        lastName = randomName.1
    }
}

struct EnvironmentExampleSwiftUIView: View {
    //承 🛐
    @Environment(PersonViewModel.self) private var personViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text(personViewModel.fullName)
                .font(.title)
            //转 ↩️
            Button("Change Person") {
                personViewModel.changePerson()
            }
        }
        .padding()
    }
}

#Preview {
    //personViewModel is specific and internal to a single class, declare  personViewModel as static  at the top of the file //启 🛫
    @Previewable @State var personViewModel = PersonViewModel()
    //合 🈴
    EnvironmentExampleSwiftUIView()
        .environment(personViewModel)
}
