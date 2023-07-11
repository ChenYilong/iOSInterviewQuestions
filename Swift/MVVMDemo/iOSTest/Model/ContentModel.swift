//
//  ContentModel.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/4.
//

import Foundation

protocol ContentModel {
    var id: Int { get }
    var body: String { get }
    var title: String { get }
}
