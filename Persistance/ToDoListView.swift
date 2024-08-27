//
//  ContentView.swift
//  Persistance
//
//  Created by Liam K. Seymour on 8/27/24.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .ignoresSafeArea()
                .foregroundColor(.orange)
            RoundedRectangle(cornerRadius: 45)
                .foregroundColor(.white)
                .frame(width: 365, height: 825)
                .offset(y: -12)
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.orange)
                        .shadow(color: .orange, radius: 10)
                    Text("To Do List")
                }
                .offset(y: 30)
                Spacer()
                
            }
        }
    }
}

#Preview {
    ToDoListView()
}
