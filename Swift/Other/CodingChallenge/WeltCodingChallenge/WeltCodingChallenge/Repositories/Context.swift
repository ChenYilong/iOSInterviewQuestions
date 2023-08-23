//
//  Context.swift
//  WeltCodingChallenge
//
//  Created by Jacklandrin on 2023/8/8.
//

import Foundation
import SwiftUI

protocol Repository {}

final class Context {

    fileprivate var repositories = [String: Repository]()

    func repository<RepositoryType>(_ type: RepositoryType.Type) -> RepositoryType {
        let typeKey = String(describing: type)
        guard let repo = repositories[typeKey] as? RepositoryType else {
            fatalError()
        }
        return repo
    }

    func register<RepositoryType>(_ type: RepositoryType.Type, repo: Repository) {
        let typeKey = String(describing: type)
        repositories[typeKey] = repo
    }

    subscript<RepositoryType>(_ type: RepositoryType.Type) -> RepositoryType {
        repository(type)
    }
}

struct ContextKey: EnvironmentKey {
    static let defaultValue: Context = Context()
}

extension EnvironmentValues {
    var context: Context {
        get { self[ContextKey.self] }
        set { self[ContextKey.self] = newValue }
    }
}
