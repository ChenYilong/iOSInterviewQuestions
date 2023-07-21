//
//  ContentCellViewModelProtocol.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/4.
//

import Foundation

protocol ContentCellViewModelProtocol: ViewModelClickable {
    associatedtype Content
    var content: Content { get set }
    init(content: Content)
}
