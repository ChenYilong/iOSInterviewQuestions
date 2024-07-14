//
//  AddTaskView.swift
//  SwiftUIRedux
//
//  Created by chenyilong on 2024/7/14.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var store: Store<AppState>
    @State private var name: String = ""
    
    struct Props {
        let tasks: [Task]
        let onTaskAdded: (Task) -> ()
    }
    
    private func map(state: TaskState) -> Props {
       return Props(tasks: state.tasks,
                    onTaskAdded: { task in
            store.dispatch(action: AddTaskAction(task: task))
        })
    }
    
    var body: some View {
        let props = map(state: store.state.taskState)
        
        VStack {
            TextField("Enter task", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
            
            Button(action: {
                let task = Task(title: self.name)
                props.onTaskAdded(task)
                // dispatch action
//                print("Add Task\(name)");
            }) {
                Text("Add Task")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            List(props.tasks, id: \.id) { task in
                    Text(task.title)
            }
            .padding()
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store<AppState>(reducer: appReducer, state: AppState())
        return AddTaskView().environmentObject(store)
    }
}
