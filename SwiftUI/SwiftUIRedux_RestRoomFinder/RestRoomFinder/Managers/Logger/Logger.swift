//
//  Logger.swift
//  RestRoomFinder
//
//  Created by Yilong Chen on 09/06/2024.
//

import Foundation

public protocol Logger {
    func debug(_ message: String)
    func info(_ message: String)
    func error(_ message: String)
    func fault(_ message: String)
}
