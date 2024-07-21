//
//  RatingView.swift
//  ReduxAsync
//
//  Created by chenyilong on 2024/7/21.
//

import Foundation
import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int?
    private func starType(for index: Int) -> String {
        if let rating = rating {
            return index < rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(0...10, id: \.self) { index in
                Image(systemName: starType(for: index))
                    .foregroundColor(.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
