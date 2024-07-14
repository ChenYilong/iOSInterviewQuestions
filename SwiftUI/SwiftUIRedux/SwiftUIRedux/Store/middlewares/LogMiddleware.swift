//
//  LogMiddleware.swift
//  SwiftUIRedux
//
//  Created by chenyilong on 2024/7/14.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        print("Action: \(action)")
    }
}
