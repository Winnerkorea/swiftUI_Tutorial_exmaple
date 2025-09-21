//
//  MacToDoListApp.swift
//  MacToDoList
//
//  Created by Baba on 9/21/25.
//

import SwiftUI

@main
struct MacToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            TasksView()
                .preferredColorScheme(.light)
        }
    }
}
