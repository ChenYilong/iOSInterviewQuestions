//
//  PostCellViewModel.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

final class PostCellViewModel: ContentCellViewModelProtocol {
    var cellPressed: (() -> Void)?
    var content: Post

    init(content: Post) {
        self.content = content
    }
}

