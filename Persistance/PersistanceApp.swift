//
//  PersistanceApp.swift
//  Persistance
//
//  Created by Liam K. Seymour on 8/27/24.
//

import SwiftUI
import SwiftData

@main
struct PersistanceApp: App {
    var body: some Scene {
        WindowGroup {
            Start_View()
                .modelContainer(for: ToDo.self, inMemory: true)
                .modelContainer(for: College.self, inMemory: true)
        }
    }
}
