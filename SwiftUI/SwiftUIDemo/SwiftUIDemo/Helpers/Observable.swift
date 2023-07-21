//
//  Observable.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

final class Observable<T> {
    var value: T {
        didSet {
            Task {
                await notifyValueChanged()
            }
        }
    }
    
    private var valueChanged: ((T) async -> Void)?
    
    init(value: T) {
        self.value = value
    }
    
    func addObserver(fireNow: Bool = true, _ onChange: ((T) async -> Void)?) {
        valueChanged = onChange
        if fireNow {
            Task {
                await notifyValueChanged()
            }
        }
    }
    
    private func notifyValueChanged() async {
        if let valueChanged = valueChanged {
            await valueChanged(self.value)
        }
    }
    
    func removeObserver() {
        valueChanged = nil
    }
}
