//
//  CommentCellViewModel.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

final class CommentCellViewModel: ContentCellViewModelProtocol {
    typealias Content = Comment
    
    var cellPressed: (() -> Void)?

    var content: Content

    init(content: Content) {
        self.content = content
    }
}
