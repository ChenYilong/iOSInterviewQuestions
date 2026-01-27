//
//  MyCustomCell.swift
//  SwiftUI101
//
//  Created by chenyilong on 2023/8/1.
//

import Foundation
import SwiftUI
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
                }.alignModifier(.trailing)
                //                .modifier(AlignModifier())
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
                                    isRotated.toggle()
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
            .alignModifier()

        }
    }
}
// MARK: ---------------------------------------------
// MARK: Background View

struct MyMeshView: View {
    
    // MARK: - State
    @State private var points: [SIMD2<Float>] = [
        [0.323, 0.199], [0.5, 0], [1, 0],
        [0, 0.5], [0.909, 0.196], [1, 0.5],
        [0, 1], [0.5, 1.0], [0.862, 0.871]
    ]
    
    @State private var colors: [Color] = [
        .indigo, .indigo, .indigo,
        .brown, .green, .white,
        .purple, .black, .mint,
    ]
    
    @State private var background: Color = .green
    
    // MARK: - Animation
    private let duration: Double = 5.0
    
    private var animation: Animation {
        .linear(duration: duration).repeatForever(autoreverses: false)
    }
    
    // MARK: - Timer
    private let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    // MARK: - Mesh
    private var mesh: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points: points,
            colors: colors,
            background: background
        )
    }
    
    // MARK: - Body
    var body: some View {
        mesh
            .animation(animation, value: points)
            .ignoresSafeArea()
            .onReceive(timer) { _ in
                randomizePointsAndColors()
            }
    }
    
    // MARK: - Randomization
    private func randomizePointsAndColors() {
        let palette: [Color] = [
            .indigo, .brown, .green, .white, .purple, .mint
        ]
        
        // 中心点轻微扰动
        points[4] = [
            Float.random(in: 0.4...0.6),
            Float.random(in: 0.4...0.6)
        ]
        colors[4] = palette.randomElement() ?? .indigo
        
        // 左上
        points[0] = [
            Float.random(in: 0.2...0.4),
            Float.random(in: 0.1...0.3)
        ]
        colors[0] = palette.randomElement() ?? .indigo
        
        // 右下
        points[8] = [
            Float.random(in: 0.6...0.8),
            Float.random(in: 0.7...0.9)
        ]
        colors[8] = palette.randomElement() ?? .indigo
        
        background = palette.randomElement() ?? .indigo
        
    }
}

struct AlignModifier: ViewModifier {
    
    let alignment : Alignment
    init(aligment: Alignment = .center) {
        self.alignment = aligment
    }
    
    func body(content: Content) -> some View {
        ZStack
        {
            MyMeshView()
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
                
        }
    }
}

extension View {
    func alignModifier(_ alignment: Alignment = .center) -> some View {
        modifier(AlignModifier(aligment: alignment))
    }
}
