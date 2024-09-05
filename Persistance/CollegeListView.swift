//
//  CollegeListView.swift
//  Persistance
//
//  Created by Liam K. Seymour on 8/27/24.
//

import SwiftUI

struct CollegeListView: View {
    
    @State var collegeAdding = ""
    @State var colleges = ["University of Illinois", "UT", "Penn State"]
    @State var collegesList = ""
    @State var collegeClick = [false, false, false]
    @State var tuitions = ["15,714", "41,070", "38,651"]
    @State var tuitionAdding = ""
    
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
                            .onTapGesture {
                                colleges.remove(at: i)
                                collegeClick.remove(at: i)
                            }
                        Spacer()
//                        VStack {
                            Image(systemName: "info.circle")
                                .onTapGesture {
                                    collegeClick[i].toggle()
                                }
                            if collegeClick[i] {
//                                Text("\(colleges[i])")
                                Text("\(tuitions[i])")
                            }
//                        }
                        
                    }
                }
                
                .frame(width: 320, height: 600)
                RoundedRectangle(cornerRadius: 60)
                    .stroke(Color.cyan, lineWidth: 15)
                    .ignoresSafeArea()
                    .background(
                        RoundedRectangle(cornerRadius: 60)
                            .fill(Color.clear)
                            .ignoresSafeArea()
                        
                    )
                    .shadow(color: Color.blue.opacity(1), radius: 15, x: 0, y: 0)
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
                        .foregroundColor(.cyan)
                    HStack {
                        TextField("Add College", text: $collegeAdding)
                            .foregroundColor(.black)
                            .font(.custom("american", size: 20))
                        TextField("Add Tuition", text: $tuitionAdding)
                            .foregroundColor(.black)
                            .font(.custom("american", size: 20))
                        Button() {
                            tuitions.append("\(tuitionAdding)")
                            tuitionAdding = ""
                            colleges.append("\(collegeAdding)")
                            collegeAdding = ""
                            collegeClick.append(false)
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
