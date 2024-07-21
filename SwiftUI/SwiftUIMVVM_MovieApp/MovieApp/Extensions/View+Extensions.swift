//
//  View+Extensions.swift
//  MovieApp
//
//  Created by Yilong Chen on 2/24/24.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
