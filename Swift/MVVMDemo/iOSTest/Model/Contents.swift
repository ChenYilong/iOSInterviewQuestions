//
//  Contents.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/30.
//

import Foundation

protocol Contents {
    associatedtype Content
    var contents: Observable<[Content]> { get }
    func setupAllContents()
    func loadEntity() async throws
    func updateEntity(_ newContents: [Content])
    func filterContentForSearchText(_ searchText: String)
    func resetFilters()
}

