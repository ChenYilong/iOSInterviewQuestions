//
//  View+Extensions.swift
//  ReduxAsync
//
//  Created by Yilong Chen on 9/21/24.
//

import Foundation
import SwiftUI 

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
