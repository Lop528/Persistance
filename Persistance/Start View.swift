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
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 60)
                    .stroke(Color.cyan, lineWidth: 12)
                    .ignoresSafeArea()
                    .background(
                        RoundedRectangle(cornerRadius: 60)
                            .fill(Color.clear)
                    )
                    .shadow(color: Color.blue.opacity(1), radius: 10, x: 0, y: 0)
                    .padding(3)
                    .ignoresSafeArea()
                HStack{
                    NavigationLink {
                        CollegeListView()
                    } label: {
                        Image(systemName: "house")
                            .font(.largeTitle)
                            .padding()
                    }
                    NavigationLink {
                        ToDoListView()
                    } label: {
                        Image(systemName: "book")
                            .font(.largeTitle)
                            .offset(y:1)
                            .padding()
                        NavigationLink {
//                            TicTacToe()
                        } label: {
                            Image(systemName: "x.circle")
                                .font(.largeTitle)
                                .padding()
                        }
                    }
                }
            }
            
        }
        
        
        
        
    }
}

#Preview {
    Start_View()
}
