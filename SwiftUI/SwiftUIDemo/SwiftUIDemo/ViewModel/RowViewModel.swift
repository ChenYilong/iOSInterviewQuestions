//
//  RowViewModel.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

/// Conform this protocol to handles user press action
protocol ViewModelClickable {
    var cellPressed: (()->Void)? { get set }
}
