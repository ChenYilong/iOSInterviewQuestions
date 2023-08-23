//
//  PlaceholderImageView.swift
//  
//
//  Created by Jacklandrin on 2023/8/7.
//

import SwiftUI

public struct PlaceholderImageView: View {

    public init() {}

    public var body: some View {
        Image(systemName: "photo.fill")
            .resizable()
            .foregroundColor(.blue)
    }
}
