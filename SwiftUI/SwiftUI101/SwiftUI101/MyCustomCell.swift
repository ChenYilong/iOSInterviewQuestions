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
    let lineWidth: CGFloat = 6
    let diameter: CGFloat = 120
    @State private var isRotated: Bool = false

    //imageRotation is specific and internal to a single class, declare  imageRotation as static  at the top of the file
    @State private var imageRotation: Double = 0
    
    //imageRotation is specific and internal to a single class, declare  imageRotation as static  at the top of the file
//    @State private var imageRotation: String = "imageRotation"
    //computed property
    var angle: Angle { isRotated ? .degrees(360) : .degrees(0) }

    //computed property
    var angularGradient: AngularGradient {
        AngularGradient(
            gradient: Gradient(colors: [
                .pink,
                .purple,
                .blue,
                .orange,
                .yellow
            ]),
            center: .center,
            angle: .zero
        )
    }
    
    var body: some View {
        ZStack {
            Color
                .cyan
                .opacity(0.7)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.green.opacity(0.5), Color(red: 139/255, green: 80/255, blue: 240/255)], startPoint: .topLeading,endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 12) {
                
                Divider()
                    .padding(.vertical, 8)
                
                VStack(alignment: .center) {
                    ZStack {
                        
                        
                        Image("iteatime")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(height: 100)
                            .rotationEffect(Angle(degrees: imageRotation))
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
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1)) {
                                    isRotated.toggle()
                                    imageRotation += 90
                                }
                            }
                        
                        
                        Circle()
                            .strokeBorder(angularGradient, lineWidth: lineWidth)
                            .rotationEffect(angle)
                            .frame(width: diameter, height: diameter)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1)) {
                                    isRotated..toggle()
                                    imageRotation += 90

                                }
                            }
                        
                        Text("touch me")
                            .font(.subheadline)
                            .padding()
                            .foregroundStyle(.red)
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
}


