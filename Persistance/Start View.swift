//
//  Start View.swift
//  Persistance
//
//  Created by Liam K. Seymour on 9/5/24.
//

import SwiftUI

struct Start_View: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    CollegeListView()
                } label: {
                    Text("Colleges")
                }
                NavigationLink {
                    ToDoListView()
                } label: {
                    Text("To Do List")
                }
            }
        }
        
        
    }
}

#Preview {
    Start_View()
}
