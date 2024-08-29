//
//  CollegeListView.swift
//  Persistance
//
//  Created by Liam K. Seymour on 8/27/24.
//

import SwiftUI

struct CollegeListView: View {
    var body: some View {
        ZStack{
            ZStack {
                       // White background
                       Color.white
                           .edgesIgnoringSafeArea(.all)
                       
                     
                       RoundedRectangle(cornerRadius: 60)
                           .stroke(Color.orange, lineWidth: 20)
                           .ignoresSafeArea()
                           .background(
                               RoundedRectangle(cornerRadius: 45)
                                   .fill(Color.white)
                           )
                           .shadow(color: Color.orange.opacity(1), radius: 20, x: 0, y: 0)
                           .padding(5)
                           .ignoresSafeArea()
                    
                   }

            
            VStack {
                Text("Colleges")
                    .bold()
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .dynamicTypeSize(.xxxLarge)
                    .padding()
                
                    
                Spacer()
            }
            .offset(y: 10)
            
        }
    }
}

#Preview {
    CollegeListView()
}
