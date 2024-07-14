//
//  IncrementMiddleware.swift
//  SwiftUIRedux
//
//  Created by chenyilong on 2024/7/14.
//

import Foundation

func incrementMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
            case _ as IncrementActionAsync:
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                dispatch(IncrementAction())
                print("Increment")
            }
        default:
            break
        }
    }
}
