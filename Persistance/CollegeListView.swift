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
            RoundedRectangle(cornerRadius: 5)
                .ignoresSafeArea()
                .foregroundColor(.orange)
            RoundedRectangle(cornerRadius:45)
                .foregroundColor(.white)
                .frame(width: 365,height: 825)
                .offset(y: -12)
            
            VStack {
                Text("Colleges")
                
            }
        }
    }
}

#Preview {
    CollegeListView()
}
