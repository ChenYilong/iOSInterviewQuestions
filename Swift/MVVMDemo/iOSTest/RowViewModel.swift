//
//  RowViewModel.swift
//  iOSTest
//
//  Created by Vishnu Sasikumar on 10/11/21.
//

import Foundation

protocol RowViewModel {}

/// Conform this protocol to handles user press action
protocol ViewModelClickable {
    var cellPressed: (()->Void)? { get set }
}
