//
//  String+Extensions.swift
//  ReduxAsync
//
//  Created by chenyilong on 2024/7/21.
//

import Foundation
import SwiftUI

extension String {
    func urlEncode() -> String {
        self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? self
    }
    
    func toInt() -> Int {
        let ratingDouble = Double(self) ?? 0
        return Int(ratingDouble.rounded())
    }
}
