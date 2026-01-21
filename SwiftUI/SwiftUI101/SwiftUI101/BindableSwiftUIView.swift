//
//  BindableSwiftUIView.swift
//  SwiftUI101
//
//  Created by chenyilong on 2026/1/21.
//

import SwiftUI
import Observation

@Observable
class Address: Identifiable {
    var street: String
    var city: String
    var state: String
    var postalCode: Int
    var country: String
    
    init(
        street: String = "\((1..<300).randomElement() ?? 1) Main Sreet",
        city: String = "Cityville",
        state: String = "Some State",
        postalCode: Int = 12345,
        country: String = "USA"
    ) {
        self.street = street
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
    }
}

struct BindableSwiftUIView: View {
    //启 🛫
    @State var addresses: [Address] = [
        Address(),
        Address(),
        Address()
    ]
    
    var body: some View {
        List(addresses) { address in
            // @Bindable var address: Address = address rewraps an observable reference into a bindable form, allowing $address.property syntax, but it hides important steps such as observation subscription and binding creation, and is best replaced by a dedicated child view using @Bindable. //承 🛐  option 2
            @Bindable var address: Address = address
            //转 ↩️
            //合 🈴
            TextField(address.street, text: $address.street)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    BindableSwiftUIView()
}
