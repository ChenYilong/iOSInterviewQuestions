//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Yilong Chen on 2/8/24.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
