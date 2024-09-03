//
//  CollegeListView.swift
//  Persistance
//
//  Created by Liam K. Seymour on 8/27/24.
//

import SwiftUI

struct CollegeListView: View {
    
    @State var collegeAdding = ""
    @State var colleges = ["SIU", "LSU"]
    @State var collegesList = ""
    @State var collegeClick = [false, false]
    
    var body: some View {
        ZStack{
            ZStack {
                Color.gray
                    .brightness(0.4)
                    .ignoresSafeArea()
                
                List(colleges.indices, id: \.self) { i in
                    HStack{
                        Text("\(colleges[i])")
                        Image(systemName: "trash.fill")
                            .foregroundColor(.red)
//                            .onTapGesture {
//                                if let index = colleges.firstIndex(of: i) {
//                                    colleges.remove(at: index)
//                                    
//                                }
//                            }
                        Spacer()
                        
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                            .brightness(-0.4)
                            .onTapGesture {
                                collegeClick[i].toggle()
                            }
                        if collegeClick[i] {
                            Text("\(colleges[i])")
                        }
                        
                        
                    }
                }
                
                .frame(width: 320, height: 600)
                RoundedRectangle(cornerRadius: 55)
                    .stroke(Color.blue, lineWidth: 30)
                    .ignoresSafeArea()
                    .background(
                        RoundedRectangle(cornerRadius: 55)
                            .fill(Color.clear)
                            .ignoresSafeArea()
                        
                    )
                    .shadow(color: Color.blue.opacity(0.5), radius: 20, x: 0, y: 5)
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
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 340, height: 50)
                        .foregroundColor(.blue)
                    HStack {
                        TextField("Add College", text: $collegeAdding)
                            .foregroundColor(.black)
                            .font(.custom("american", size: 25))
                        Button() {
                            colleges.append("\(collegeAdding)")
                            collegeAdding = ""
                        } label: {
                            Text("+")
                                .foregroundColor(.black)
                                .font(.custom("american", size: 25))
                        }
                        
                    }
                    .padding(20)
                }
            }
            .padding()
        }
    }
}


#Preview {
    CollegeListView()
}
