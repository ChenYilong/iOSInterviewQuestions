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
        NavigationLink(destination: DetailView(index: index, title: title)) {
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
    var title: String
    // Define numbers once with an initializer
    @State private var numbers: [Int] = [100, 200, 300, 500, 600, 700, 800, 900, 1000]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Divider()
                .padding(.vertical, 8)
            
            VStack {
                Image("iteatime")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(height: 100)
                    .background {
                        Circle()
                            .foregroundColor(.blue)
                            .offset(x: 10, y: 10)
                    }
                    .background {
                        Circle()
                            .foregroundColor(.yellow)
                            .offset(x: -10, y: 10)
                    }
                    .background {
                        Circle()
                            .foregroundColor(.red)
                            .offset(x: 10, y: -10)
                    }
                Spacer().frame(height: 10)
                
                Text("Detail view for row \(index)")
                    .font(.largeTitle)
                
                List(numbers, id: \.self) { number in
                    Text("\(number) is a number")
                }
                
            }
        }
        .padding()
        .navigationTitle(title)
    }
}



