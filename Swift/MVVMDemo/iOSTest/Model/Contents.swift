//
//  Contents.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/30.
//

import Foundation

protocol ContentsProtocol {
    associatedtype Content
    var contents: Observable<[Content]> { get }
    func setupAllContents()
    func loadEntity() async throws
    func updateEntity(_ newContents: [Content])
    func filterContentForSearchText(_ searchText: String)
    func resetFilters()
}

class Contents<N: Networking, T: Codable, R: Request>: ObservableObject, ContentsProtocol where N.R == R {
    
    typealias Content = T
    
    @Published var contents: Observable<[Content]> = Observable<[Content]>(value: [])
    var originalContents: [Content] = []
    var networking: N
    
    init(networking: N) {
        self.networking = networking
    }
    
    func setupAllContents() {
        contents.value = originalContents
    }
    
    func loadEntity() async throws {
        fatalError("please override this method")

    }
    
    func updateEntity(_ newContents: [Content]) {
        contents.value = newContents
    }
    
    func filterContentForSearchText(_ searchText: String) {
        fatalError("please override this method")
    }
    
    func resetFilters() {
        setupAllContents()
    }
}

