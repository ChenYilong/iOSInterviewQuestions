//
//  MyCustomCell.swift
//  SwiftUI101
//
//  Created by chenyilong on 2023/8/1.
//

import Foundation
import SwiftUI

struct MyCustomCell: View {
    var title: String
    var subtitle: String
    var index: Int

    var body: some View {
        NavigationLink(destination: DetailView(index: index)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding(.vertical, 8)
        }
    }
}

struct DetailView: View {
    var index: Int
    
    var body: some View {
        Text("Detail view for row \(index)")
    }
}

