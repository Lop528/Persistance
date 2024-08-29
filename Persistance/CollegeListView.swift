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
                       
                     
                       RoundedRectangle(cornerRadius: 20)
                           .stroke(Color.orange, lineWidth: 6)
                           .background(
                               RoundedRectangle(cornerRadius: 20)
                                   .fill(Color.white)
                           )
                           .shadow(color: Color.orange.opacity(0.5), radius: 10, x: 0, y: 5)
                           .padding(20)
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
            .offset(y: 30)
            
        }
    }
}

#Preview {
    CollegeListView()
}
