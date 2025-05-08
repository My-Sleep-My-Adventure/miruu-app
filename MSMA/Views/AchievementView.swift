//
//  AchievementView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct AchievementView: View {
    @State private var data = Data()
    //    var limit = data.listData.count
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(){
                    Text("Achievement")
                        .font(.title3)
                        
                    Spacer()
                    Text("\(data.unlockedCountAchievement)/\(data.listDataAchievement.count)")
                        .foregroundStyle(Color.gray)
                    
                }
                .padding(.top)
                .padding(.horizontal, 30)
                
                
                
                VStack {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 5) {
                        ForEach(0..<data.listDataAchievement.count) { index in
                            VStack {
                                if data.listDataAchievement[index].status {
                                    NavigationLink(destination: AchievDetail(data: data.listDataAchievement[index])) {
                                        VStack {
                                            
                                            Image("achiev\(index+1)")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 70, height: 90)
                                            //                                            .clipShape(Circle())
                                            
                                            Text(data.listDataAchievement[index].name)
                                                .font(.caption)
                                                .bold()
                                                .foregroundColor(.black)
                                            
                                        }
                                    }
                                    
                                } else {
                                    VStack {
                                        Circle()
                                            .stroke(Color.gray, lineWidth: 2)
                                            .fill(Color("A5D4DA"))
                                            .frame(width: 70, height: 90)
                                            .overlay(
                                                Text("?")
                                                    .font(.title)
                                                    .foregroundColor(Color("pickerbackground"))
                                                    .bold()
                                            )
                                            
                                        Text("")
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .background(Color("FEFCFA"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
        .padding(.horizontal)
        
    }
}

//#Preview {
//    AchievementView()
//}
