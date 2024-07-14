//
//  TaskReducer.swift
//  SwiftUIRedux
//
//  Created by chenyilong on 2024/7/14.
//

import Foundation

func taskReducer(_ state: TaskState,_ action: Action) -> TaskState {
    var state = state
    switch action {
    case let action as AddTaskAction:
        state.tasks.append(action.task)
    default:
        break
    }
    
    return state
}
