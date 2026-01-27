//
//  ScrollTransitionSwiftUIView.swift
//  SwiftUI101
//
//  Created by chenyilong on 2026/1/26.
//
import SwiftUI
import SwiftUI

struct ScrollTransitionSwiftUIView: View {
    let images = ["iteatime", "iteatime1", "iteatime2", "iteatime3", "iteatime4"]
    
    // Infinite scrolling data
    var loopImages: [String] {
        [images.last!] + images + [images.first!]
    }
    
    @State private var currentIndex: Int? = nil  // ✅ Initialized as nil
    @State private var hasAppeared = false       // ✅ Track first load
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(loopImages.indices, id: \.self) { index in
                            VStack {
                                Image(loopImages[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width - 32)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .scrollTransition { content, phase in
                                        content
                                            .scaleEffect(phase.isIdentity ? 1.0 : 0.9)
                                            .opacity(phase.isIdentity ? 1.0 : 0.6)
                                    }
                                    .containerRelativeFrame(.horizontal)
                                    .id(index)
                                Text("\(index)")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    .scrollTargetLayout()
                    .contentMargins(16, for: .scrollContent)
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $currentIndex)
                .onAppear {
                    // ✅ Set to the first image (index = 1) on initial load
                    if !hasAppeared {
                        currentIndex = 1
                        hasAppeared = true
                    }
                }
                .onChange(of: currentIndex) { oldValue, newValue in
                    handleLoopingIfNeeded(newValue)
                }
                
                Spacer()
            }
        }
    }
    
    // MARK: - Infinite scroll correction logic
    private func handleLoopingIfNeeded(_ index: Int?) {
        guard let index = index, hasAppeared else { return }
        
        let lastIndex = loopImages.count - 1
        
        if index == 0 {
            // From the false head → jump to the true tail
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                currentIndex = lastIndex - 1
            }
        } else if index == lastIndex {
            // From the fake tail → jump to the real head
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                currentIndex = 1
            }
        }
    }
}

#Preview {
    ScrollTransitionSwiftUIView()
}
