//
//  PersistanceApp.swift
//  Persistance
//
//  Created by Liam K. Seymour on 8/27/24.
//

import SwiftUI

@main
struct PersistanceApp: App {
    var body: some Scene {
        WindowGroup {
            CollegeListView()
                .modelContainer(for: College.self)
        }
    }
}
