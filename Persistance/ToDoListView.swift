//
//  ToDoListView.swift
//  Persistance
//
//  Created by Liam K. Seymour on 8/27/24.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        ZStack {
            ZStack {
                       Color.white
                           .ignoresSafeArea()
                       
                     
                       RoundedRectangle(cornerRadius: 55)
                           .stroke(Color.orange, lineWidth: 50)
                           .ignoresSafeArea()
                           .background(
                               RoundedRectangle(cornerRadius: 55)
                                   .fill(Color.white)
                                   .ignoresSafeArea()

                           )
                           .shadow(color: Color.orange.opacity(0.5), radius: 10, x: 0, y: 5)
                           .ignoresSafeArea()

                   }
            VStack {
                ZStack {
                    Text("To Do List")
                        .font(.custom("American Typewriter", size: 55))
                }
                Text("First Item")
                Spacer()
                
            }
        }
    }
}

#Preview {
    ToDoListView()
}
