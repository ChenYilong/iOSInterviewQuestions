//
//  Date+Extensions.swift
//  MovieApp
//
//  Created by Yilong Chen on 2/24/24.
//

import Foundation

extension Date {
    
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
    
}
