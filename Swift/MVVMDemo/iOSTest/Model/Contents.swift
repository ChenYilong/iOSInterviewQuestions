//
//  Contents.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/30.
//

import Foundation

protocol MVVMModelProtocol {
    associatedtype Entity
    var entity: Observable<[Entity]> { get }
    func loadEntity() async throws
    func updateEntity(_ newEntity: [Entity])
    func filterEntityForSearchText(_ searchText: String)
}

class Contents<N: Networking, T: Codable, R: Request>: ObservableObject, MVVMModelProtocol where N.R == R {
    
    typealias Entity = T
    
    @Published var entity: Observable<[Entity]> = Observable<[Entity]>(value: [])
    var originalContents: [Entity] = []
    var networking: N
    
    init(networking: N) {
        self.networking = networking
    }
    
    func setupAllContents() {
        entity.value = originalContents
    }
    
    func loadEntity() async throws {
        fatalError("please override this method")
    }
    
    func updateEntity(_ newEntity: [Entity]) {
        entity.value = newEntity
    }
    
    func filterEntityForSearchText(_ searchText: String) {
        fatalError("please override this method")
    }
    
    func resetFilters() {
        setupAllContents()
    }
    
    deinit {
        entity.removeObserver()
    }
    
}

