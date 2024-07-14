//
//  ContentView.swift
//  SwiftUIRedux
//
//  Created by chenyilong on 2024/7/14.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
    }
    
    private func map(state: CounterState) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        }, onDecrement: {
            store.dispatch(action: DecrementAction())
        }, onAdd: {
            store.dispatch(action: addAction(value: $0))
        }
        )
    }
    
    var body: some View {
        
        let props = map(state: store.state.counterState)
        
        VStack {
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("\(props.counter)")
                .font(.largeTitle)
            Button(action: {
                props.onIncrement()
            }) {
                Text("Increment")
            }
            
            Button(action: {
                props.onDecrement()
            }) {
                Text("Decrement")
            }
            
            Button(action: {
                props.onAdd(10)
            }) {
                Text("Add 10")
            }
            Spacer()
            
            Button(action: {
//                store.dispatch(action: getMoviesAction(moveis: ["movie1", "movie2"]))
                isPresented = true
            }) {
                Text("Add Tasks")
            }
        }
        .padding().sheet(isPresented: $isPresented) {
            Text("Add text view")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: counterReducer, state: CounterState())
        ContentView().environmentObject(store)
    }
}
